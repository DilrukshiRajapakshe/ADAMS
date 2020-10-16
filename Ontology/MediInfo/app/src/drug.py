import requests
# from nltk.corpus import wordnet
import wordnet

from app.src.mainService import NameValue, runQuery, keyWordIdentification


def get_Decision_Of_drug(user_sentences):
    list_drug = runQuery("service2")
    description_list = equalityDrug(user_sentences)
    if description_list is None:
        name_list = NameValue(list_drug, user_sentences)
        description_list = keyWordIdentification(name_list, "service2")

    return description_list


def equalityDrug(sentence):
    url = 'http://localhost:3030/ds/sparql'

    description_list = None
    _queryDrug = """ 
                    PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>          
                    SELECT *
                    WHERE { 
                          ?adams adams:Name ?Name ;
                          adams:Description ?Description ;
                          adams:Synonyms ?Synonyms ;
                          adams:Type ?Type ;
                          VALUES ?Type {"Drug"} 
                    }        
                """

    _r = requests.get(url, params={'format': 'json', 'query': _queryDrug})
    semi_data = _r.json()
    semi_list = semi_data["results"]["bindings"]
    for a in range(len(semi_list)):
        Description = semi_list[0]["Name"]["value"]
        word1 = wordnet.synsets(sentence)[0]
        word2 = wordnet.synsets(Description)[0]
        similarity = word1.wup_similarity(word2)
        if similarity == 1:
            description_list = semi_list[0]["Description"]["value"]
    return description_list

