from flask import Flask, request, json
from app.MainMethod import mainMethod
# from app.Main_Crud import importOwl

# main = Flask(__name__, importOwl())
main = Flask(__name__)


@main.route('/api/v1/onto', methods=['POST'])
def doi_hm():
    response = request.get_json()
    user_sentences = response['sentences']

    _LIST = mainMethod(user_sentences)
    json_dump = json.dumps([dict(Value=v) for v in _LIST])
    return json_dump


if __name__ == '__main__':
    main.run(host='0.0.0.0', debug=True, port=8003)
