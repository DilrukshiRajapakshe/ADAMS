from app.CONSTANT import SYMPTOMS_DESCRIPTION, ALL_SYMPTOMS_DESCRIPTION
from app.Main_Crud import getALL, tokenizer
from collections import Counter


# intent value retrievals
def description(_Intent, _nameTypeList):
    _list = []
    for i in range(len(_Intent)):
        _query = SYMPTOMS_DESCRIPTION(_Intent[i], _nameTypeList)
        _list.append({_Intent[i]: getALL(_query)})

    return _list


# max value and key of main intent repite  time
def descriptionTokenizer(description_list):
    _list = []
    for i in range(len(description_list)):
        value = (list(description_list[i].values()))[0]
        _key = description_list[i].keys()
        for a in range(len(value)):
            _list.append(tokenizer(value[a]["Description"]["value"]))

    return ("Main_Key", MaxKey(_list)), ("Main_Value", (Counter(joinValue(_list)))[MaxKey(_list)]), (
        "intent_list", _list)


# join multiple array
def joinValue(_list):
    _joinList = []

    for i in range(len(_list)):
        _value = _list[i]
        _joinList = _value + _joinList

    return _joinList


# max value
def MaxKey(_joinList):
    return max(joinValue(_joinList))


# max value of main intent key
def get_All_Description(_list):
    _list_intent = dict(descriptionTokenizer(_list))
    _list_des = _list_intent["Main_Key"]

    value = []

    _list = getALL(ALL_SYMPTOMS_DESCRIPTION)
    for a in range(len(_list)):
        value.append(tokenizer(_list[a]["Description"]["value"]))

    return (Counter(joinValue(value)))[_list_des]


def calculation(_list):
    _list_intent = dict(descriptionTokenizer(_list))
    _intent_list = _list_intent["intent_list"]
    _join_list = list((Counter(joinValue(_intent_list))).items())

    for i in range(len(_join_list)):
        key = (list(_join_list[i]))[0]
        value = (list(_join_list[i]))[1]
