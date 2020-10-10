import requests
from collections import Counter
from app.src.mainService import keyWordIdentification, runQuery, NameValue

url = 'http://localhost:3030/ds/sparql'


def DescriptionValue(list_):
    value = []
    for i in range(len(list_)):
        getList = list_[i]["Description"]["value"]
        value = getList.split(",") + value
    return value


def sortList(_list):
    _list_count = []

    for i in sorted(dict(Counter(_list)).keys()):
        _list_count.append({i: str(dict(Counter(_list))[i])})
    return _list_count


def percentageValue(all_list, count_list):
    percentageList = []

    for a in range(len(all_list)):
        for i in range(len(count_list)):
            if all_list[a].keys() == count_list[i].keys():
                percentage = '{0:.6f}'.format((int(list(all_list[a].values())[0]) /
                                               int(list(count_list[a].values())[0]) * 100))
                keys = str(count_list[i].keys())
                keys = keys.split("'")
                percentageList.append({keys[1]: percentage})

    return percentageList


def percentageDialog(percentage):
    last = ""
    for i in range(len(percentage)):
        _value = float(list(percentage[i].values())[0])
        _key = str(percentage[i].keys())
        _key = _key.split("'")
        percentageDi = _key[1] + " රෝගය වැළදීමේ සම්භාවිතාවය " + str(_value) + "% ප්‍රතිශතයක්ද, "
        last = percentageDi + last
    return last


def getDialog(percentage):
    decision = None
    const = "ඔබ ලබා දුන් රෝග ලක්ෂණ අනුව "
    max_ = validationMax(percentage)
    p = percentageDialog(percentage).rsplit(",", 1)
    print(specific(percentage))
    if max_ == 1:
        decision = const + p[0] + " පමණ වේ. ඔබට " + \
                   str(maxValue(percentage)) + " ප්‍රතිශතයකට වඩා වැඩි ප්‍රතිශතයකින් " + maxValueDIS(percentage) + \
                   " නම් රෝගයේ රෝග ලක්ෂණ ඇති බවට තහවුරු වී ඇත. " + specific(percentage)
    elif max_ == 0:
        decision = "ඔබ ලබා දුන් තොරතුරු ප්‍රමාණවත් නොවේ."
    elif max_ > 1:
        decision = const + p[0] + " පමණ වේ."
    return decision


def maxValue(percentage):
    returnValue = []
    max_value = 0
    for i in range(len(percentage)):
        value = float(list(percentage[i].values())[0])
        if value >= 75.00:
            returnValue.append(value)
    if len(returnValue) == 0:
        max_value = 0
    else:
        max_value = max(returnValue)
    return max_value


def validationMax(percentage):
    maxV = maxValue(percentage)
    count = 0
    for i in range(len(percentage)):
        value = float(list(percentage[i].values())[0])
        if value == maxV:
            count = count + 1
    return count


def maxValueDIS(percentage):
    dict_V = {}
    max_key = ""
    for i in range(len(percentage)):
        value = float(list(percentage[i].values())[0])
        if value >= 75:
            key = str(percentage[i].keys())
            key = key.split("'")
            dict_V = {key[1]: percentage[i].values() for i in range(len(percentage))}

    if len(dict_V) == 0:
        max_key = "None"
    else:
        max_key = max(dict_V.keys())
    return max_key


def specific(percentage):
    _specific = maxValueDIS(percentage)
    specific_query = """ 
                    PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>          
                    SELECT *
                    WHERE { 
                        ?adams adams:Name ?Name ;
                        adams:Specific ?Specific ;
                        VALUES ?Name {'""" + _specific + """'} 
                    }       
                """
    r = requests.get(url, params={'format': 'json', 'query': specific_query})
    data = r.json()
    _list = data["results"]["bindings"]
    value = []
    for i in range(len(_list)):
        value = _list[i]["Specific"]["value"]

    return value


def get_Decision_Of_symptom_identification(user_sentences):
    # to get all Symptoms list executing a sparql query
    listO = runQuery("service1")
    # given user information(user dialog)
    # user_sentences = "උගුර රිදෙනවා මද උණ ගතිය ඔළුව රිදෙනවා"
    # get Symptoms general name value according to user dialogue
    name_list = NameValue(listO, user_sentences)
    # get Disease values
    Description_split_list = DescriptionValue(listO)
    # get Disease values according to user dialogue
    description_list = keyWordIdentification(name_list, "service1")
    # get Disease count values according to user dialogue Symptoms
    description_list_count = sortList(description_list)
    # get All Disease count values according to user dialogue Symptoms and others
    count_listO = sortList(Description_split_list)
    percentage = percentageValue(description_list_count, count_listO)

    return getDialog(percentage)

