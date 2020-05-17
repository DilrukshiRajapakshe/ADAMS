from SPARQLWrapper import SPARQLWrapper, JSON

# Specify the DBPedia endpoint
id = "B001"
url = "http://localhost:8000/buyerService/api/v1/buyer/" + id
sparql = SPARQLWrapper(url)


# Convert results to JSON format
sparql.setReturnFormat(JSON)
result = sparql.query().convert()
print(result)
