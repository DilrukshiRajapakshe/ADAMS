import requests
from app import CONSTANT


# retrieving an ontology file
def getALL(_query):
    _r = requests.get(CONSTANT.URL, params={'format': 'json', 'query': _query})
    _dataAll = _r.json()
    _listAll = _dataAll["results"]["bindings"]

    return _listAll


# split value
def tokenizer(_word):
    return _word.split(",")


# split value
def getNameType(name):
    _array = str(name).split("'")
    return _array[1]

