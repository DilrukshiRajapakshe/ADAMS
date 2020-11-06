from flask import Flask, request, jsonify
from gevent.pywsgi import WSGIServer
from firebase import firebase
import keywordExtractor
from googletrans import Translator
translator = Translator()

firebase = firebase.FirebaseApplication('https://medbot-b31d6.firebaseio.com/', None)
result = firebase.get('/users', None)

app = Flask(__name__)

@app.route('/api', methods=['GET'])
def index():
    return "Hello, MedBot!"

@app.route('/api/v1/classify', methods=['POST'])
def classify():
    data = request.json
    message = data.get('message', '')
    english = translator.translate(message)
    english = english.text
    
    #keyword Extractor
    keyword_dictionary = keywordExtractor.getDict('test.csv')
    keyword_processor = keywordExtractor.processor()
    keyword_processor.add_keywords_from_dict(keyword_dictionary)
    byenglish = keyword_processor.extract_keywords(english)
    bysinhala = keyword_processor.extract_keywords(message)
    
    resmessage = {"byEnglish":byenglish,"bySinhala":bysinhala}
    return jsonify(resmessage)

@app.route('/apifirebase', methods=['GET'])
def firebase():
    print(result)
    return result

if __name__ == '__main__':
    # Debug/Development
    app.run(debug=True, host="0.0.0.0", port="5000")
    # Production
    #http_server = WSGIServer(('', 5000), app)
    #http_server.serve_forever()
