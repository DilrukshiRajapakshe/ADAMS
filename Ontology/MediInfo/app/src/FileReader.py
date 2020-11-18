import json


def read_json(service):
    f = open('static/query.json', )
    data = json.load(f)
    query = ""
    for i in data['sparql']:
        if i['function'] == service:
            print(i['query'])
            query = i['query']
    f.close()
    return query
