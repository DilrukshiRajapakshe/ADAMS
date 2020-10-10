# UIsuru
## Interface between Model and user Text
import numpy as np
import pandas as pd
import seaborn as sns
import pickle

from tensorflow.keras.models import load_model
from keras.preprocessing import sequence

from tqdm import tqdm
from nltk.corpus import stopwords
from nltk.tokenize import RegexpTokenizer

def find(word, maxClass=2, reqPreScore=True):
    """
        Args:
            word : the full text need to be classify
            maxClass : this provide the return class limit
                Default 0
        
        Returns:
            dictionary : All the extraction 
                         classifications with its predicted value
    """
    sns.set_style("whitegrid")
    np.random.seed(0)
    
    tokenizer = RegexpTokenizer(r'\w+')
    
    stop_words = set(stopwords.words('english'))
    stopwords_sinhala = open('../../dataset/StopWords_si.txt', 'r', encoding='utf-16').read()
    stopwords_new = [x.strip() for x in stopwords_sinhala.split(' ')]
    stop_words = set(stopwords_new)
    stop_words.update(['.', ',', '"', "'", ':', ';', '(', ')', '[', ']', '{', '}'])
    
    #load data
    train_df = pd.read_csv("../../dataset/FastText_Embeddings_Train.csv", sep=',', header=0,encoding='utf-8')
    my_dict = { ' ' : ["1"],
                'sinhala' : [word]}
    #nrows=0 only read header this makes more faster the csv read ^_~
    #train_df = pd.read_csv("../dataset/FastText_Embeddings_Train.csv", nrows=0, sep=',', header=0,encoding='utf-8')
    
    test_df = pd.DataFrame(my_dict)
    
    train_df.dropna(axis=0, how='all',inplace=True)
    test_df.dropna(axis=0, how='all',inplace=True)
    
    test_df = test_df.fillna('_NA_')
    
    #visualize word distribution
    train_df['doc_len'] = train_df['sinhala'].apply(lambda words: len(str(words).split(" ")))
    max_seq_len = np.round(train_df['doc_len'].mean() + train_df['doc_len'].std()).astype(int)
    
    raw_docs_test = test_df['sinhala'].tolist() 
    
    processed_docs_test = []
    for doc in tqdm(raw_docs_test):
        tokens = tokenizer.tokenize(doc)
        filtered = [word for word in tokens if word not in stop_words]
        processed_docs_test.append(" ".join(filtered))
    #end for
    
    with open('../../dataset/models/tokenizer.pickle', 'rb') as handle:
        tokenizer = pickle.load(handle)
        
    word_seq_test = tokenizer.texts_to_sequences(processed_docs_test)
    
    #print(processed_docs_test)
    #print(word_seq_test)
    
    #pad sequences
    word_seq_test = sequence.pad_sequences(word_seq_test, maxlen=max_seq_len)
    
    # load model
    #print("Load model to disk")
    
    model = load_model('../../dataset/models/classificationModel.h5')
    y_test = model.predict(word_seq_test)
    
    #delete unwanted columns
    del train_df['sinhala']
    del train_df['doc_len']
    
    result = {}

    for i, val in enumerate(train_df.columns):
        result[val] =  y_test[0][i]
        
    #Sort a dictionary by value
    result = {k: v for k, v in sorted(result.items(), key=lambda item: item[1],reverse=True)}
    #print(y_test[0])
    #print(result)
    if maxClass<train_df.columns.size:
        result = {k: result[k] for k in list(result)[:maxClass]}
    
    if reqPreScore:
        return result
    else:
        #order is not promised
        result = {*result}
        return result