from app import CONSTANT
from app.Main_Crud import getALL
from app.Question.Question_Crud import getSynonyms, getNameValueList, getImportantKey, getAllValueOfTypeList, getAllIntent


def question_mainMethod(sentence):
    #   step -> 01
    # question identification ------ Start
    _list = getALL(CONSTANT.QUESTION)
    _synonymsList = getSynonyms(_list)
    _nameType = getImportantKey(_synonymsList, sentence)
    typeList = dict(getNameValueList(_nameType))
    _nameTypeList = typeList["Name_Type"]
    _questionTypeList = typeList["Question_Type"]
    # question identification ------ End
    #   step -> 02
    # intent identification------ Start
    _allKey = getAllValueOfTypeList(_nameTypeList)
    allIntentKeys = dict(getAllIntent(_nameType, _allKey, sentence))
    _Type = allIntentKeys["Type"]
    _Intent = allIntentKeys["Intent"]
    print(_nameTypeList)
    print(_Intent)
    print(_nameTypeList[0])
    # identification------ End
    return ("_questionTypeList", _questionTypeList[0]), ("_Intent", _Intent), ("_nameTypeList", _nameTypeList[0])
