from googletrans import Translator
import spacy
import json

translator = Translator()

trans = 'මට දියවැඩියාව සම්බන්ධ වෛද්යවරයෙක් හමුවීමට අවශ්‍යයි'

translated = translator.translate(trans,src = 'si' , dest = 'en')
print(translated.text)
print("")
print("")
nlp = spacy.load("en_core_web_sm")

text = translated.text
doc = nlp(text)

for token in doc:
    print(token, token.pos_)

print("Noun",[token.text for token in doc if token.pos_ == "NOUN"])
print("")
print("")
data = [token.text for token in doc if token.pos_ == "NOUN"]

json_format = json.dumps(data)
print("*******************")
print("...................")
print("Identified Important facts :",json_format)
print("...................")
print("*******************")

