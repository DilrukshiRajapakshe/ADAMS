from flask import Flask, request
import json
from app.src.disease import get_Decision_Of_disease
from app.src.drug import get_Decision_Of_drug
from app.src.symptom_identification import get_Decision_Of_symptom_identification

main = Flask(__name__)


@main.route('/api/v1/symptom', methods=['POST'])
def identification():
    response = request.get_json()
    user_sentences = response['sentences']
    return_value_ = get_Decision_Of_symptom_identification(user_sentences)
    json_string = '{"value" : "' + return_value_ + '"}'
    json_dump = json.dumps(json_string)
    json_object = json.loads(json_dump)

    return json_object


@main.route('/api/v1/drug', methods=['POST'])
def drug():
    response = request.get_json()
    user_sentences = response['sentences']
    return_value_ = get_Decision_Of_drug(user_sentences)
    json_string = '{"value" : "' + return_value_ + '"}'
    json_dump = json.dumps(json_string)
    json_object = json.loads(json_dump)

    return json_object


@main.route('/api/v1/disease', methods=['POST'])
def Symptom():
    response = request.get_json()
    user_sentences = response['sentences']
    return_value_ = get_Decision_Of_disease(user_sentences)
    json_string = '{"value" : "' + return_value_ + '"}'
    json_dump = json.dumps(json_string)
    json_object = json.loads(json_dump)

    return json_object


if __name__ == '__main__':
    main.run(host='0.0.0.0', debug=True, port=8001)
