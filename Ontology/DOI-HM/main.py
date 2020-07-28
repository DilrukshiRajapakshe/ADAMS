from SPARQLWrapper import SPARQLWrapper, XML, N3, RDFXML
from rdflib import Graph
from flask import Flask
import requests

main = Flask(__name__)


@main.route('/')
def Drug():
    url = 'http://localhost:3030/ds/sparql'
    query = """PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#> SELECT * {?Approved 
    adams:Uses adams:DIS0001} """

    r = requests.get(url, params={'format': 'json', 'query': query})
    data = r.json()
    return data


if __name__ == '__main__':
    main.run(debug=True, port=15000)
