from googletrans import Translator


def translate(sentences):
    translator = Translator()
    result = translator.translate(sentences, dest='en')
    return result.text
