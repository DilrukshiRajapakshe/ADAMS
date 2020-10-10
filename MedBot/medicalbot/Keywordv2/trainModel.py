# UIsuru
## Used to train a clasify model
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

#import keras
from tensorflow.keras import optimizers
#from tensorflow.keras import backend as K
from tensorflow.keras import regularizers
from tensorflow.keras.models import Sequential
#from tensorflow.keras.layers import Dense, Activation, Dropout, Flatten
from tensorflow.keras.layers import Dense, Dropout
from tensorflow.keras.layers import Embedding, Conv1D, MaxPooling1D, GlobalMaxPooling1D 
#from tensorflow.keras.utils import plot_model
from tensorflow.keras.preprocessing import sequence
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.callbacks import EarlyStopping

from tqdm import tqdm
from nltk.corpus import stopwords
from nltk.tokenize import RegexpTokenizer 
import codecs
#import os, re, csv, math, codecs

print('To run this you need GPU, otherwise it will return an error')
sns.set_style("whitegrid")
np.random.seed(0)

DATA_PATH = '../dataset/'
EMBEDDING_DIR = '../dataset/'

MAX_NB_WORDS = 100000
tokenizer = RegexpTokenizer(r'\w+')

stop_words = set(stopwords.words('english'))
stopwords_sinhala = open('../dataset/StopWords_si.txt', 'r', encoding='utf-16').read()
stopwords_new = [x.strip() for x in stopwords_sinhala.split(' ')]
stop_words = set(stopwords_new)
stop_words.update(['.', ',', '"', "'", ':', ';', '(', ')', '[', ']', '{', '}'])
print(stop_words)

#from subprocess import check_output
#print(check_output(["ls", "../dataset"]).decode("utf8"))

#load embeddings
print('loading word embeddings...')
embeddings_index = {}
f = codecs.open('../dataset/cc.si.300.vec', encoding='utf-8')
for line in tqdm(f):
    values = line.rstrip().rsplit(' ')
    word = values[0]
    coefs = np.asarray(values[1:], dtype='float32')
    embeddings_index[word] = coefs
f.close()
print('found %s word vectors' % len(embeddings_index))

#load data
train_df = pd.read_csv("../dataset/FastText_Embeddings_Train.csv", sep=',', header=0,encoding='utf-8')
test_df = pd.read_csv('../dataset/FastText_Embeddings_Test.csv', sep=',', header=0,encoding='utf-8')

#removes empty, blank rows.
train_df.dropna(axis=0, how='all',inplace=True)
test_df.dropna(axis=0, how='all',inplace=True)

test_df = test_df.fillna('_NA_')

print("num train: ", train_df.shape[0])
print("num test: ", test_df.shape[0])

label_names = ["billing", "ask_for_bill_amount", "packages", "ask_for_own_package_details", "vas", "vas_activate_info","vas_activate_now"]
y_train = train_df[label_names].values

#visualize word distribution
# train_df['doc_len'] = train_df['sinhala'].apply(lambda words: len(words.split(" ")))
train_df['doc_len'] = train_df['sinhala'].apply(lambda words: len(str(words).split(" ")))
max_seq_len = np.round(train_df['doc_len'].mean() + train_df['doc_len'].std()).astype(int)
sns.distplot(train_df['doc_len'], hist=True, kde=True, color='b', label='doc len')
plt.axvline(x=max_seq_len, color='k', linestyle='--', label='max len')
plt.title('Sinhala word length'); plt.legend()
plt.show()

raw_docs_train = train_df['sinhala'].tolist()
raw_docs_test = test_df['sinhala'].tolist() 
print(raw_docs_train)
print(raw_docs_test)
num_classes = len(label_names)

print("pre-processing train data...")
processed_docs_train = []
print(raw_docs_train)
for doc in tqdm(raw_docs_train):
    tokens = tokenizer.tokenize(doc)
    filtered = [word for word in tokens if word not in stop_words]
    processed_docs_train.append(" ".join(filtered))
#end for

processed_docs_test = []
for doc in tqdm(raw_docs_test):
    tokens = tokenizer.tokenize(doc)
    filtered = [word for word in tokens if word not in stop_words]
    processed_docs_test.append(" ".join(filtered))
#end for

print("tokenizing input data...")
tokenizer = Tokenizer(num_words=MAX_NB_WORDS, lower=True, char_level=False)
#tokenizer.fit_on_texts(processed_docs_train + processed_docs_test)  #leaky
tokenizer.fit_on_texts(processed_docs_train)
word_seq_train = tokenizer.texts_to_sequences(processed_docs_train)
word_seq_test = tokenizer.texts_to_sequences(processed_docs_test)
word_index = tokenizer.word_index
print("dictionary size: ", len(word_index))

#pad sequences
word_seq_train = sequence.pad_sequences(word_seq_train, maxlen=max_seq_len)
word_seq_test = sequence.pad_sequences(word_seq_test, maxlen=max_seq_len)

#training params
batch_size = 256 
num_epochs = 80 

#model parameters
num_filters = 64 
embed_dim = 300 
weight_decay = 1e-4

#embedding matrix
print('preparing embedding matrix...')
words_not_found = []
nb_words = min(MAX_NB_WORDS, len(word_index))
embedding_matrix = np.zeros((nb_words, embed_dim))
for word, i in word_index.items():
    if i >= nb_words:
        continue
    embedding_vector = embeddings_index.get(word)
    if (embedding_vector is not None) and len(embedding_vector) > 0:
        # words not found in embedding index will be all-zeros.
        embedding_matrix[i] = embedding_vector
    else:
        words_not_found.append(word)
print('number of null word embeddings: %d' % np.sum(np.sum(embedding_matrix, axis=1) == 0))

print("sample words not found: ", np.random.choice(words_not_found, 10))

#CNN architecture
print("training CNN ...")
model = Sequential()
model.add(Embedding(nb_words, embed_dim,
          weights=[embedding_matrix], input_length=max_seq_len, trainable=False))
model.add(Conv1D(num_filters, 7, activation='relu', padding='same'))
model.add(MaxPooling1D(2))
model.add(Conv1D(num_filters, 7, activation='relu', padding='same'))
model.add(GlobalMaxPooling1D())
model.add(Dropout(0.5))
model.add(Dense(32, activation='relu', kernel_regularizer=regularizers.l2(weight_decay)))
model.add(Dense(num_classes, activation='sigmoid'))  #multi-label (k-hot encoding)

adam = optimizers.Adam(lr=0.001, beta_1=0.9, beta_2=0.999, epsilon=1e-08, decay=0.0)
model.compile(loss='binary_crossentropy', optimizer=adam, metrics=['accuracy'])
model.summary()

#define callbacks
early_stopping = EarlyStopping(monitor='val_loss', min_delta=0.01, patience=4, verbose=1)
callbacks_list = [early_stopping]

#model training
hist = model.fit(word_seq_train, y_train, batch_size=batch_size, epochs=num_epochs, callbacks=callbacks_list, validation_split=0.1, shuffle=True, verbose=2)

print(word_seq_test)
model.save("../dataset/models/classificationModel.h5")
print("Saved model to disk")
y_test = model.predict(word_seq_test)
print(y_test)

#create a submission
submission_df = pd.DataFrame(columns=['sinhala'] + label_names)
submission_df['sinhala'] = test_df['sinhala'].values 
submission_df[label_names] = y_test 
submission_df.to_csv("./cnn_fasttext_submission.csv", index=False)

#generate plots
plt.figure()
plt.plot(hist.history['loss'], lw=2.0, color='b', label='train')
plt.plot(hist.history['val_loss'], lw=2.0, color='r', label='val')
plt.title('CNN sentiment')
plt.xlabel('Epochs')
plt.ylabel('Cross-Entropy Loss')
plt.legend(loc='upper right')
plt.show()

plt.figure()
plt.plot(hist.history['acc'], lw=2.0, color='b', label='train')
plt.plot(hist.history['val_acc'], lw=2.0, color='r', label='val')
plt.title('CNN sentiment')
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.legend(loc='upper left')
plt.show()