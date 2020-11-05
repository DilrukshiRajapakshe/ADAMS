#!flask/bin/python
# building RESTful services with Flask
# import jsonify
from flask import Flask, jsonify, request
from webexteamssdk.models import cards

app = Flask(__name__)

# declaring a GET request
@app.route('/cards', methods=['GET'])
def create_card():
    # request the data
    request_data = request.get_json()
    # parse the arguments with an array
    new_cards = {
        'statusId': request_data["statusId"],
        'logincount': request_data["logincount"],
        'newUser': request_data["newUser"],
        'importantFact': request_data["importantFact"],
        'name': request_data["name"],
    }
    # append the data into an array called cards
    cards.append(new_cards)
    # return the arguments with an array
    return jsonify(cards)


app.run()
