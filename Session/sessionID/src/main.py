from flask import Flask, request
import json

main = Flask(__name__)


@main.route('/test', methods=['POST'])
def test():
    t = request.get_json()
    print(t)
    word = t['Value'].split()

    return json.dumps(word)


if __name__ == '__main__':
    main.run(host='0.0.0.0', debug=True, port=8000)
