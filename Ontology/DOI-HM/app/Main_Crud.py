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


# uploading owl file into Apache Jena Fuseki
# def importOwl():
#     data = open(OWL, encoding="utf-8").read()
#     headers = {'Content-Type': 'application/rdf+xml; boundary=----WebKitFormBoundaryc8DYiSwZQFPx4yH1'}
#     r = requests.post(URL_DATA, data=data.encode('utf-8'), headers=headers)


# retrieving an ontology file with specific value only
def getIndividual(_list, _individual):
    _individualList = []
    for a in range(len(_list)):
        _individualList.append(_list[a][_individual]["value"])
    return _individualList
