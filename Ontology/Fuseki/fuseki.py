import requests

URL_DATA = 'http://localhost:3030/adams/data'

OWL = 'static/adams-medil.owl'


def importOwl():
    data = open(OWL, encoding="utf-8").read()
    headers = {'Content-Type': 'application/rdf+xml; boundary=----WebKitFormBoundaryc8DYiSwZQFPx4yH1'}
    r = requests.post(URL_DATA, data=data.encode('utf-8'), headers=headers)


importOwl()
