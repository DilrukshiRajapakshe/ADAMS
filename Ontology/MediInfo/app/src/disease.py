from app.src.mainService import runQuery, NameValue, keyWordIdentification


def get_Decision_Of_disease(user_sentences):
    list_drug = runQuery("service3")
    name_list = NameValue(list_drug, user_sentences)
    description_list = keyWordIdentification(name_list, "service3")

    return description_list
