from app.CONSTANT import SYMPTOMS_DESCRIPTION, ALL_SYMPTOMS_DESCRIPTION, SPECIFIC
from app.Main_Crud import getALL, tokenizer, getNameType, getIndividual
from collections import Counter
from flask import json


# intent value retrievals
def description(_Intent, _nameTypeList):
    _list = []
    for i in range(len(_Intent)):
        _query = SYMPTOMS_DESCRIPTION(_Intent[i], _nameTypeList)
        _list.append({_Intent[i]: getALL(_query)})

    return _list


# important key
def descriptionTokenizer(description_list):
    _list = []
    for i in range(len(description_list)):
        value = (list(description_list[i].values()))[0]
        _key = description_list[i].keys()
        for a in range(len(value)):
            _list.append(tokenizer(value[a]["Description"]["value"]))

    return ("Main_Key", MaxKey(_list)), ("intent_list", _list)


# join multiple array
def joinValue(_list):
    _joinList = []

    for i in range(len(_list)):
        _value = _list[i]
        _joinList = _value + _joinList

    return _joinList


# max value
def MaxKey(value):
    return max(value)


# get all description list
def get_All_Description(_list_des):
    value = []
    _list = getALL(ALL_SYMPTOMS_DESCRIPTION)
    for a in range(len(_list)):
        value.append(tokenizer(_list[a]["Description"]["value"]))
    return value


# cleaning data(avoiding data redundancy)
def listOfMainKey(_intent_list, _intent_list_all):
    _list = getList(list((Counter(joinValue(_intent_list))).items()))
    _list_all = getList(list((Counter(joinValue(_intent_list_all))).items()))
    return ("_all", _list_all), ("_list", _list)


# creating list
def getList(_list):
    returnList = []
    for i in range(len(_list)):
        key = (list(_list[i]))[0]
        value = (list(_list[i]))[1]
        returnList.append({key: value})
    return returnList


# calculation
def calculation(_list_all, _list):
    _dictValue = {k: v for i in _list_all for (k, v) in i.items()}
    returnValue = []

    for i in range(len(_list)):
        if getNameType(_list[i].keys()) in (list(_dictValue.keys())):
            percentage = '{0:.6f}'.format((int(list(_list[i].values())[0]) /
                                           int(_dictValue.get(getNameType(_list[i].keys()))) * 100))
            returnValue.append({getNameType(_list[i].keys()): percentage})

    dictMax = {k: v for i in returnValue for (k, v) in i.items()}
    _maxKey = MaxKey(dictMax)
    _maxValue = dictMax.get(_maxKey)

    return ("percentage", returnValue), ("_maxValue", _maxValue), ("_maxKey", _maxKey)


# dialogue creation
def dialogue(_percentage, maxV, maxK):
    _List = []
    _thirdDialogue = []
    _secondDialogue = []
    if maxV >= 50:
        _firstDialogue = fistDialogue(_percentage)
        secDig = str(maxV) + "% වැඩි ප්‍රතිශතයකින්" + maxK + " රෝගයේ රෝග ලක්ෂණ ඇති බවට තහවුරු වී ඇත."
        _secondDialogue.append(secDig)
        _thirdDialogue.append(specific(maxK))

        _List = ["දත්ත විශ්ලේෂණය :", _firstDialogue, "තීරණය :", _secondDialogue, "වැඩි විස්තරය :", _thirdDialogue]
    else:
        _List = ["තොරතුරු ප්‍රමාණවත් නොවේ"]

    return _List


#
def fistDialogue(_percentageAll):
    _firstDialogue = []
    for i in range(len(_percentageAll)):
        key = list(_percentageAll[i].keys())[0]
        value = list(_percentageAll[i].values())[0]
        dialog = "" + key + ": " + value + "% "
        _firstDialogue.append(dialog)
    return _firstDialogue


# max value
def specific(maxK):
    _list = getALL(SPECIFIC(maxK))
    return "" + getIndividual(_list, "Specific")[0]
