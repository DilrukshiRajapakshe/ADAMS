from app.Disease.MainMethodDisease import disease_mainMethod
from app.Drug.MainMethodDrug import drug_mainMethod
from app.Error.Error import error_mainMethod
from app.Question.MainMethodQuestion import question_mainMethod
from app.Symptoms.MainMethodSymptoms import symptoms_mainMethod


def mainMethod(sentence):
    _q_mainMethod = dict(question_mainMethod(sentence))
    _questionTypeList = _q_mainMethod["_questionTypeList"]
    _Intent = _q_mainMethod["_Intent"]
    _nameTypeList = _q_mainMethod["_nameTypeList"]

    return switchCase(_questionTypeList, _Intent, _nameTypeList, sentence)


def switchCase(value, _Intent, _nameTypeList, sentence):
    case = ""

    if value in "Symptoms":
        case = symptoms_mainMethod(_Intent, _nameTypeList, sentence),
    elif value in "Drug":
        case = drug_mainMethod(_Intent, _nameTypeList, sentence),
    elif value in "Disease":
        case = disease_mainMethod(_Intent, _nameTypeList, sentence),
    else:
        case = error_mainMethod(_Intent, _nameTypeList, sentence)

    return case
