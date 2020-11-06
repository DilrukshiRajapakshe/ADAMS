from app.Symptoms.Symptoms_Crud import description, get_All_Description, calculation


def symptoms_mainMethod(_Intent, _nameTypeList, sentence):
    _list = description(_Intent, _nameTypeList)
    get_All_Description(_list)
    calculation(_list)
    return "xxx"
