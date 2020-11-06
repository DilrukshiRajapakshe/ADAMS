import json


class Query:
    query = ""

    def read_json(self, service):
        f = open('static/query.json', )
        data = json.load(f)

        for i in data['sparql']:
            if i['function'] == service:
                self.query = i['query']
        f.close()
        return self.query

    def print_querry(self):
        print(
              "PREFIX adams: <https://adams-medi.000webhostapp.com/adams.owl#>\n"
              "SELECT * WHERE { \n"
              "?adams adams:Name ?Name ; \n"
              "adams:Description ?Description ; \n"
              "adams:Synonyms ?Synonyms ; \n"
              "adams:Type ?Type ; \n"
              "VALUES ?Type {'Symptoms'} \n"
              " }"
        )
