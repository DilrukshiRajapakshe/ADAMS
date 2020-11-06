from flask import Flask, request
from app.MainMethod import mainMethod

main = Flask(__name__)


@main.route('/api/v1/onto', methods=['POST'])
def hello_world():

    response = request.get_json()
    user_sentences = response['sentences']
    mainMethod(user_sentences)

    return 'Hello World!'


if __name__ == '__main__':
    main.run(host='0.0.0.0', debug=True, port=8003)