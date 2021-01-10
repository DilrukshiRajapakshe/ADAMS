from flask import Flask, jsonify, request
from webexteamssdk.models import cards

main = Flask(__name__)


def __init__(self):
    self.result = []


# declaring a GET request
@main.route('/api/v1//Plugin', methods=['GET'])
def create_card_get(self):
    # request the data
    request_data = self.result.get_json()
    # parse the arguments with an array
    new_cards = {
        'statusId': request_data["massage"]["statusId"],
        'logincount': request_data["massage"]["logincount"],
        'newUser': request_data["massage"]["newUser"],
        'importantFact': request_data["massage"]["importantFact"],
        'name': request_data["massage"]["name"],
    }
    # append the data into an array called cards
    cards.append(new_cards)
    # return the arguments with an array
    return jsonify(cards)


@main.route('/cards', methods=['POST'])
def create_card_post(self):
    # request the data
    request_data = request.get_json()
    # parse the arguments with an array
    new_cards = {
        'status': request_data["massage"]["status"],
        'logincount': request_data["massage"]["logincount"],
        'newUser': request_data["massage"]["newUser"],
        'importantFact': request_data["massage"]["importantFact"],
        'email': request_data["massage"]["email"],
    }
    # append the data into an array called cards
    cards.append(new_cards)
    # return the arguments with an array
    self.result = jsonify(cards);
    return jsonify(cards)


if __name__ == '__main__':
    main.run(host='0.0.0.0', debug=True, port=8006)
