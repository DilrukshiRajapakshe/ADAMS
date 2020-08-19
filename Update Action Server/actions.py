# This files contains your custom actions which can be used to run
# custom Python code.
#
# See this guide on how to implement these action:
# https://rasa.com/docs/rasa/core/actions/#custom-actions/


# This is a simple example for a custom action which utters "Hello World!"

from typing import Any, Text, Dict, List

from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import SlotSet
from datetime import datetime
import requests
import urllib
import json



# class ActionHelloWorld(Action):
#
#     def name(self) -> Text:
#         return "action_hello_world"
#
#     def run(self, dispatcher: CollectingDispatcher,
#             tracker: Tracker,
#             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
#
#         dispatcher.utter_message(text="Hello World!")
#
#         return []



class ActionRegister(Action):

     def name(self) -> Text:
         return "action_register"

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

             now = datetime.now()

             current_time = now.strftime("%H")
             
            

             response = requests.get("http://127.0.0.1:5000/api/adams").json()
             username = ""
             status   = ""
             identification = ""
             answer = ""

             username = response[0]["name"]
             status = response[0]["status"]
             identification = response[0]["identification"]

             print("Current Time =", current_time)
             print (type(current_time))
             print("Username:",username)
             print("Status:",status)
             print("Idetification",identification)

             
             
             if status == "olduser":
                if identification == "true":
                     if int(current_time) in range(0, 12): 
                         answer = "සුබ උදෑසනක්, "+response[0]["name"]+" ඔබව නැවතත් හමුවීම සතුටක් ඔබට මගෙන් වියයුතු සේවාව කුමක්ද? වෛද්‍යවරයෙකු හමුවීම,රෝග හදුනාගැනීම, රෝග පිලිබදව විස්තර දැනගැනීම, ඖෂධ පිලිබද විස්තර දැනගැනීම"
                     elif int(current_time) in range(12, 16):
                         answer = "සුබ දහවලක්, "+response[0]["name"]+" ඔබව නැවතත් හමුවීම සතුටක් ඔබට මගෙන් වියයුතු සේවාව කුමක්ද? වෛද්‍යවරයෙකු හමුවීම,රෝග හදුනාගැනීම, රෝග පිලිබදව විස්තර දැනගැනීම, ඖෂධ පිලිබද විස්තර දැනගැනීම"
                     elif int(current_time) in range(14, 19):
                         answer = "සුබ සවස් යාමයක්, "+response[0]["name"]+" ඔබව නැවතත් හමුවීම සතුටක් ඔබට මගෙන් වියයුතු සේවාව කුමක්ද? වෛද්‍යවරයෙකු හමුවීම,රෝග හදුනාගැනීම, රෝග පිලිබදව විස්තර දැනගැනීම, ඖෂධ පිලිබද විස්තර දැනගැනීම"
                     elif int(current_time) in range(19, 24):
                         answer = "සුබ රාත්‍රියක්, "+response[0]["name"]+" ඔබව නැවතත් හමුවීම සතුටක් ඔබට මගෙන් වියයුතු සේවාව කුමක්ද? වෛද්‍යවරයෙකු හමුවීම,රෝග හදුනාගැනීම, රෝග පිලිබදව විස්තර දැනගැනීම, ඖෂධ පිලිබද විස්තර දැනගැනීම"
                elif identification == "false":
                     answer =response[0]["name"]+" ඔබ ලබා දුන් රහස්‍ය නාමය වැරදී කරුනාකර නැවත උත්සාහ කරන්න"
             elif status == "newuser":
                if int(current_time) in range(0, 12):
                    answer = "සුබ උදෑසනක්, "+response[0]["name"]+ " ඔබව පද්ධතියට සාදරයෙන් පිලිගන්නවා. ඔබට මගෙන් වියයුතු සේවාව කුමක්ද? වෛද්‍යවරයෙකු හමුවීම,රෝග හදුනාගැනීම, රෝග පිලිබදව විස්තර දැනගැනීම, ඖෂධ පිලිබද විස්තර දැනගැනීම"
                elif int(current_time) in range(12, 16):
                    answer =  "සුබ දහවලක්, "+response[0]["name"]+" ඔබව පද්ධතියට සාදරයෙන් පිලිගන්නවා. ඔබට මගෙන් වියයුතු සේවාව කුමක්ද? වෛද්‍යවරයෙකු හමුවීම,රෝග හදුනාගැනීම, රෝග පිලිබදව විස්තර දැනගැනීම, ඖෂධ පිලිබද විස්තර දැනගැනීම"
                elif int(current_time) in range(14, 19):
                    answer = "සුබ සවස් යාමයක්, "+response[0]["name"]+ " ඔබව පද්ධතියට සාදරයෙන් පිලිගන්නවා. ඔබට මගෙන් වියයුතු සේවාව කුමක්ද? වෛද්‍යවරයෙකු හමුවීම,රෝග හදුනාගැනීම, රෝග පිලිබදව විස්තර දැනගැනීම, ඖෂධ පිලිබද විස්තර දැනගැනීම"
                elif int(current_time) in range(19, 24):
                    answer = "සුබ රාත්‍රියක්, "+response[0]["name"]+ " ඔබව පද්ධතියට සාදරයෙන් පිලිගන්නවා. ඔබට මගෙන් වියයුතු සේවාව කුමක්ද? වෛද්‍යවරයෙකු හමුවීම,රෝග හදුනාගැනීම, රෝග පිලිබදව විස්තර දැනගැනීම, ඖෂධ පිලිබද විස්තර දැනගැනීම"
             print(answer)
             dispatcher.utter_message(text = answer)
             return []



class ActionMeetDoctor(Action):

     def name(self) -> Text:
         return "action_meet_doctor"

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
              
             response = requests.get("http://127.0.0.1:5000/api/adams").json()
             print(response)
             dispatcher.utter_message(text="ඔබට හමුවිය හැකි වෛද්‍යවරුන් වන්නේ "+ response[0]["title"])

             return []

class ActionDoctorLocation(Action):

     def name(self) -> Text:
         return "action_doctor_location"

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
              
             response = requests.get("http://127.0.0.1:5000/api/adams").json()
             print(response)
             dispatcher.utter_message(text="ඔබගේ වෛද්‍යවරයා හමුවියහැකි ස්ථානය, දිනය සහ වේලාව මෙසේය. කරුනාකර ඔබ අවශ්‍යය ස්ථානය, දිනය සහ වේලාව පවසන්න"+ response[0]["title"])

             return []

class ActionApointmentSession(Action):

     def name(self) -> Text:
         return "action_apoint_session"

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

             response = requests.get("http://127.0.0.1:5000/api/adams").json()
             

              
             sessionid = ""
             sessionid = response[0]["id"]
             

             print(sessionid)
             idvariable = ""
             if sessionid == "1":
                 idvariable = "ඔබගේ වෛද්‍ය හමුව වෙන්කරවා ගැනීම සාර්ථකයි ඔබගේ රෝගීන් පරීක්ශා කිරීමේ අංකය වනුයේ "+response[0]["title"]+" කරුණාකර ඔබ වෙන්කරගත් වේලාවට පැමිනීමට කාරුණික වන්න."
             elif sessionid == "0":
                 idvariable = "කරුණාකර නැවත උත්සාහ කරන්න"
             print(idvariable)
             dispatcher.utter_message(text = idvariable)

             return []

class ActionIdetifyDisease(Action):

     def name(self) -> Text:
         return "action_identify_disease"

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
              
             response = requests.get("http://127.0.0.1:5000/api/adams").json()
             print(response)
             dispatcher.utter_message(text="ඔබ පැවසූ රෝග ලක්ෂන වලට අදාලව විස්තර මෙසේය "+ response[0]["title"])

             return []

class ActionDiseaseDetails(Action):

     def name(self) -> Text:
         return "action_disease_details"

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
              
             response = requests.get("http://127.0.0.1:5000/api/adams").json()
             print(response)
             dispatcher.utter_message(text="ඔබ පැවසූ රෝගයට අදාලව විස්තර මෙසේය "+ response[0]["title"])

             return []

class ActionMediDetails(Action):

     def name(self) -> Text:
         return "action_medi_details"

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
              
             response = requests.get("http://127.0.0.1:5000/api/adams").json()
             print(response)
             dispatcher.utter_message(text="ඔබ පැවසූ ඖෂධයට අදාලව විස්තර මෙසේය "+ response[0]["title"])

             return []