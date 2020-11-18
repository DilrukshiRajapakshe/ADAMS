from app.Drug.Drug_Crud import description


def drug_mainMethod(_Intent, _nameTypeList, sentence, _action):
    return [description(_Intent, _action)]
