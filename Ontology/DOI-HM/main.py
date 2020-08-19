from flask import Flask, request
import json
import requests

main = Flask(__name__)


@main.route('/')
def Drug():
    # SPARQL query server URL
    url = 'http://localhost:3030/ds/sparql'
    # SPARQL Query
    query = """PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#> SELECT ?object 
    WHERE {?subject ?predicate ?object
      FILTER (?subject = adams:DRUG0001 && ?predicate = adams:Description ) 
    } """
    # Query process
    r = requests.get(url, params={'format': 'json', 'query': query})
    # Convert to JSON
    data = r.json()
    # JSON value retrieve
    h = json.dumps(data["results"]["bindings"], ensure_ascii=False)
    # Str value split
    y = h.split('[')
    x = y[1].split(']')
    # Convert to JSON
    z = json.loads(x[0])
    # JSON value retrieve
    Value = z['object']['value']

    return z


@main.route('/test', methods=['GET', 'POST'])
def test():
    if request.method == 'POST':
        t = request.get_json()
        value = t['value']
        print(value.split())
    return "Successfully stored"


if __name__ == '__main__':
    main.run(debug=True, port=15000)
