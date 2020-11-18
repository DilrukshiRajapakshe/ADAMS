from app.Drug_Prescribe.Drug_Prescribe_Crud import description


def drug_prescribe_mainMethod(_Intent, _nameTypeList, sentence, _action):
    return [description(_Intent, _action)]
