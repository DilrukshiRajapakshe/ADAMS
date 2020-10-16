import requests

from app.src.FileReader import read_json

url = 'http://localhost:3030/ds/sparql'


def runQuery(service):
    query = read_json(service)
    r = requests.get(url, params={'format': 'json', 'query': query})
    data = r.json()
    _list = data["results"]["bindings"]
    return _list


def NameValue(list_, sentence):
    name_list = []
    for i in range(len(list_)):
        Synonyms = list_[i]["Synonyms"]["value"]
        value = Synonyms.split(",")
        for a in range(len(value)):
            if value[a] in sentence:
                name_list.append(list_[i]["Name"]["value"])
    return name_list


def keyWordIdentification(_list, service):
    description_list = []

    for i in range(len(_list)):
        semi_query = """ 
                PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>          
                SELECT *
                WHERE { 
                      ?adams adams:Name ?Name ;
                      adams:Description ?Description ;
                      adams:Synonyms ?Synonyms ;
                      adams:Type ?Type ;
                      VALUES ?Name {'""" + _list[i] + """'} 
                }        
            """

        semi_r = requests.get(url, params={'format': 'json', 'query': semi_query})
        semi_data = semi_r.json()
        semi_list = semi_data["results"]["bindings"]

        for a in range(len(semi_list)):
            Description = semi_list[0]["Description"]["value"]
            if service == "service1":
                split_list = Description.split(",")
                description_list = split_list + description_list
            else:
                description_list = Description

    return description_list
