from SPARQLWrapper import SPARQLWrapper, JSON
from flask import Flask

main = Flask(__name__)


@main.route('/yes')
def hello_world():
    sparql = SPARQLWrapper("http://linkedlifedata.com/sparql")
    sparql.setQuery("""
        PREFIX drugbank: <http://www4.wiwiss.fu-berlin.de/drugbank/resource/drugbank/>
        SELECT DISTINCT ?drug_uri ?label ?indication ?mechanismOfAction ?biotransformation ?halfLife
        FROM <http://linkedlifedata.com/resource/drugbank>
        WHERE {
          ?drug_uri a drugbank:drugs .
          ?drug_uri rdfs:label ?label . FILTER(regex(?label, "warfarin", "i"))
          OPTIONAL { ?drug_uri drugbank:brandName ?brandName . FILTER(regex(?brandName, "warfarin", "i")) }
          OPTIONAL { ?drug_uri drugbank:indication ?indication . }
          OPTIONAL { ?drug_uri drugbank:mechanismOfAction ?mechanismOfAction . } 
          OPTIONAL { ?drug_uri drugbank:biotransformation ?biotransformation . }
          OPTIONAL { ?drug_uri drugbank:halfLife ?halfLife . }
        }
    """)
    sparql.setReturnFormat(JSON)
    results = sparql.query().convert()

    print(results)

    return results


if __name__ == '__main__':
    main.run(debug=True, port=15000)
