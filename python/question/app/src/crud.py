import requests

from app.src import constant


def getALL(_query):
    _r = requests.get(constant.URL, params={'format': 'json', 'query': _query})
    _dataAll = _r.json()
    _listAll = _dataAll["results"]["bindings"]
    return _listAll


def getIndividual(_list, _individual):
    _individualList = []
    for a in range(len(_list)):
        _individualList.append(_list[a][_individual]["value"])
    return _individualList


def tokenizer(_word):
    return _word.split(",")


def getSynonyms(_list):
    _individualList = []
    for a in range(len(_list)):
        _individualList.append({_list[a]["Name"]["value"]: tokenizer(_list[a]["Synonyms"]["value"])})
    return _individualList


# def getNameWithType(_list):
#     _individualList = []
#     for a in range(len(_list)):
#         _individualList.append({_list[a]["Name"]["value"]: _list[a]["Type"]["value"]})
#     return _individualList
#
#
# def getTypeWithName(_list, _type):
#     _individualList = []
#     _TypeWithNamList = []
#
#     for a in range(len(_list)):
#         if _list[a]["Type"]["value"] == _type:
#             _TypeWithNamList.append(_list[a]["Name"]["value"])
#     _individualList.append({_type: _TypeWithNamList})
#     return _individualList
