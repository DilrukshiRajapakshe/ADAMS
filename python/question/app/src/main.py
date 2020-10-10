from flask import Flask
import operator
from app.src import constant
from app.src.crud import getALL, getSynonyms

main = Flask(__name__)


@main.route('/')
def hello_world():
    _list = getALL(constant.QUESTION)
    synonymsList = getSynonyms(_list)
    g = "මට ministering අතුරු ආබාධ මොනවද කියලා දැනගන්න ඕන"
    for i in range(len(synonymsList)):
        value = (list(synonymsList[i].values()))[0]
        t = synonymsList[i].keys()
        for a in range(len(value)):
            if value[a] in g:
                print(t)
                print(value[a])

    return 'Hello World!'


if __name__ == '__main__':
    main.run()
