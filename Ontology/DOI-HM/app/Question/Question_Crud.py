from app.Main_Crud import getALL, tokenizer, getNameType, getIndividual
from app.CONSTANT import ONE_QUESTION, NAME, NAME_TYPE


# retrieving Synonyms value in given list
def getSynonyms(_list):
    _individualList = []
    for a in range(len(_list)):
        _individualList.append({_list[a]["Name"]["value"]: tokenizer(_list[a]["Synonyms"]["value"])})
    return _individualList


#  get Question_Type and Name_Type  in all question
def getNameValueList(_nameType):

    _Question_Type = getIndividual(getALL(ONE_QUESTION(_nameType)), "Question_Type")
    _Name_Type = getIndividual(getALL(ONE_QUESTION(_nameType)), "Name_Type")

    return ("Question_Type", _Question_Type), ("Name_Type", _Name_Type)


# identified user question
def getImportantKey(_list, sentence):
    returnValue = ""
    for i in range(len(_list)):
        value = (list(_list[i].values()))[0]
        _key = _list[i].keys()
        for a in range(len(value)):
            if value[a] in sentence:
                returnValue = getNameType(_key)
    return returnValue


# retrieving all value
def getAllValueOfTypeList(typeList):
    _list = []
    for i in range(len(typeList)):
        _list.append({typeList[i]: getSynonyms(getALL(NAME(typeList[i])))})
    return _list


# identified important keys
def getAllIntent(_nameType, allKey, sentence):
    _keyType = []
    _keyName = []
    for i in range(len(allKey)):
        value1 = (list(allKey[i].values()))[0]
        _key1 = allKey[i].keys()
        for a in range(len(value1)):
            _key2 = value1[a].keys()
            value2 = (list(value1[a].values()))
            for x in range(len(value2)):
                value3 = value2[x]
                for y in range(len(value3)):
                    value4 = value3[y]
                    if value4 in sentence:
                        _keyType.append(getNameType(_key1))
                        _keyName.append(getNameType(_key2))

    return ("Type", list(set(_keyType))), ("Intent", list(set(_keyName)))


def getQuestion_NameType_(TypeList, _Intent):

    returnValue = ""

    if len(TypeList) > 1:
        _type = getIndividual(getALL(NAME_TYPE(_Intent[0])), "Type")
        returnValue = _type[0]
    else:
        returnValue = TypeList[0]
    return returnValue



