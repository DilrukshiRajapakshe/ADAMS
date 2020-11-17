from app.Disease.Disease_Crud import description


def disease_mainMethod(_Intent, _nameTypeList, sentence, _action):
    return [description(_Intent, _action)]
