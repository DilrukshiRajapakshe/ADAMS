from app.Disease_Prescribe.Disease_Prescribe_Crud import description, get_All_Description, listOfMainKey, descriptionTokenizer, \
    calculation, dialogue


def Disease_Prescribe_mainMethod(_Intent, _nameTypeList, sentence, _action):
    _list = description(_Intent, _nameTypeList)

    _list_intent = dict(descriptionTokenizer(_list))
    _list_des = _list_intent["Main_Key"]
    _intent_list = _list_intent["intent_list"]

    _All_Description = get_All_Description(_list_des)

    _count_info = dict(listOfMainKey(_intent_list, _All_Description))
    _list = _count_info["_list"]
    _all = _count_info["_all"]

    _cal = dict(calculation(_all, _list))
    _percentage = _cal["percentage"]
    _maxValue = float(_cal["_maxValue"])
    _maxKey = _cal["_maxKey"]

    dialogue(_percentage, _maxValue, _maxKey)

    return dialogue(_percentage, _maxValue, _maxKey)
