from app.Symptoms.Symptoms_Crud import description


def symptoms_mainMethod(_Intent, _nameTypeList, sentence, _action):
    return [description(_Intent, _action)]
