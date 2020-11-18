from app.Disease.MainMethodDisease import disease_mainMethod
from app.Drug.MainMethodDrug import drug_mainMethod
from app.Drug_Prescribe.MainMethodDrugPrescribe import drug_prescribe_mainMethod
from app.Error.Error import error_mainMethod
from app.Question.MainMethodQuestion import question_mainMethod
from app.Disease_Prescribe.MainMethodDiseasePrescribe import Disease_Prescribe_mainMethod
from app.Symptoms.MainMethodSymptoms import symptoms_mainMethod


def mainMethod(sentence):
    _q_mainMethod = dict(question_mainMethod(sentence))
    _questionTypeList = _q_mainMethod["_questionTypeList"]
    _Intent = _q_mainMethod["_Intent"]
    _nameTypeList = _q_mainMethod["_nameTypeList"]
    _action = _q_mainMethod["action"]

    return switchCase(_questionTypeList, _Intent, _nameTypeList, _action, sentence)


def switchCase(value, _Intent, _nameTypeList, _action, sentence):
    case = []

    if value == "Disease_Prescribe":
        case = Disease_Prescribe_mainMethod(_Intent, _nameTypeList, sentence, _action)
    elif value == "Drug_Prescribe":
        case = drug_prescribe_mainMethod(_Intent, _nameTypeList, sentence, _action)
    elif value == "Drug":
        case = drug_mainMethod(_Intent, _nameTypeList, sentence, _action)
    elif value == "Disease":
        case = disease_mainMethod(_Intent, _nameTypeList, sentence, _action)
    elif value == "Symptoms":
        case = symptoms_mainMethod(_Intent, _nameTypeList, sentence, _action)
    elif value == "Age":
        case = disease_mainMethod(_Intent, _nameTypeList, sentence, _action)
    else:
        case = error_mainMethod(_Intent, _nameTypeList, sentence, _action)

    return case
