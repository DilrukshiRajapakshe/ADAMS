from app import CONSTANT
from app.Main_Crud import getALL
from app.Question.Question_Crud import getSynonyms, getNameValueList, getImportantKey, getAllValueOfTypeList, \
    getAllIntent, getQuestion_NameType_


def question_mainMethod(sentence):

    # question identification ------ Start
    _list = getALL(CONSTANT.QUESTION)
    _synonymsList = getSynonyms(_list)
    _name = getImportantKey(_synonymsList, sentence)
    typeList = dict(getNameValueList(_name))
    _nameTypeList = typeList["Name_Type"]
    _questionTypeList = typeList["Question_Type"]

    # intent identification------ Start
    _allKey = getAllValueOfTypeList(_nameTypeList)
    allIntentKeys = dict(getAllIntent(_name, _allKey, sentence))
    _Type = allIntentKeys["Type"]
    # print(_name)
    _Intent = allIntentKeys["Intent"]
    # identification------ End
    _questionType = getQuestion_NameType_(_questionTypeList, _Intent)
    _nameType = getQuestion_NameType_(_nameTypeList, _Intent)
    # question identification ------ End

    return ("_questionTypeList", _questionType), ("_Intent", _Intent), ("_nameTypeList", _nameType), \
           ("action", _name)
