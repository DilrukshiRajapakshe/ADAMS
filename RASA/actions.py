from typing import Any, Text, Dict, List

from rasa_sdk import Action, Tracker
from rasa_sdk.executor import CollectingDispatcher
from rasa_sdk.events import SlotSet
from datetime import datetime
import requests

# ADAMS open message
class ActionRegister(Action):

     def name(self) -> Text:
         return "action_register" # action id

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

             now = datetime.now() #Catch the rela time 

             current_time = now.strftime("%H") #Catch the rela time 
             
            

             response = requests.get("http://127.0.0.1:5000/api/adams").json() #JSON  data Url
             username = "" #Create Username variable
             status   = "" #Create Status variable 
             identification = "" #Create Identification variable 
             answer = "" #Create answer variable

             username = response[0]["name"] #connect username variable with json url varible
             status = response[0]["status"] #connect status variable with json url varible
             identification = response[0]["identification"] #connect identification variable with json url varible
             print("Username:",username)
          
             if status == "olduser": # Check the status about the user
                if identification == "true": # If old user secret name is correct
                     if int(current_time) in range(0, 12): # Old user morning message of the system
                         answer = "සුබ උදෑසනක්, "+response[0]["name"]+" ඔබව නැවතත් හමුවීම සතුටක් ඔබට මගෙන් වියයුතු සේවාව මින් කුමක්ද? වෛද්‍යවරයෙකු වෙන්කරවා ගැනීමට අංක '1' ලෙස පවසන්න, වෛද්‍ය උපදෙස් ලබා ගැනීමටනම් අංක '2' ලෙස පවසන්න , ඇඩම්ස් හදුනාගැනීම සදහා අංක '3' ලෙස පවසන්න" 
                     elif int(current_time) in range(12, 16): # Old user afternoon message of the system
                         answer = "සුබ දහවලක්, "+response[0]["name"]+" ඔබව නැවතත් හමුවීම සතුටක් ඔබට මගෙන් වියයුතු සේවාව මින් කුමක්ද? වෛද්‍යවරයෙකු වෙන්කරවා ගැනීමට අංක '1' ලෙස පවසන්න, වෛද්‍ය උපදෙස් ලබා ගැනීමටනම් අංක '2' ලෙස පවසන්න , ඇඩම්ස් හදුනාගැනීම සදහා අංක '3' ලෙස පවසන්න" 
                     elif int(current_time) in range(14, 19): # Old user evening message of the system
                         answer = "සුබ සැන්දෑවක්, "+response[0]["name"]+" ඔබව නැවතත් හමුවීම සතුටක් ඔබට මගෙන් වියයුතු සේවාව මින් කුමක්ද? වෛද්‍යවරයෙකු වෙන්කරවා ගැනීමට අංක '1' ලෙස පවසන්න, වෛද්‍ය උපදෙස් ලබා ගැනීමටනම් අංක '2' ලෙස පවසන්න , ඇඩම්ස් හදුනාගැනීම සදහා අංක '3' ලෙස පවසන්න" 
                     elif int(current_time) in range(19, 24): # Old user night message of the system
                         answer = "සුබ රාත්‍රියක්, "+response[0]["name"]+" ඔබව නැවතත් හමුවීම සතුටක් ඔබට මගෙන් වියයුතු සේවාව මින් කුමක්ද? වෛද්‍යවරයෙකු වෙන්කරවා ගැනීමට අංක '1' ලෙස පවසන්න,  වෛද්‍ය උපදෙස් ලබා ගැනීමටනම් අංක '2' ලෙස පවසන්න , ඇඩම්ස් හදුනාගැනීම සදහා අංක '3' ලෙස පවසන්න" 
                elif identification == "false": # If old user secret name is incorrect
                     answer =response[0]["name"]+" ඔබ ලබා දුන් රහස්‍ය නාමය වැරදී කරුනාකර නැවත උත්සාහ කරන්න"
             elif status == "newuser": # Check the status about the user
                if int(current_time) in range(0, 12): # new user morning message of the system
                    answer = "සුබ උදෑසනක්, "+response[0]["name"]+ " ඔබව පද්ධතියට සාදරයෙන් පිලිගන්නවා. ඔබට මගෙන් වියයුතු සේවාව මින් කුමක්ද? වෛද්‍යවරයෙකු වෙන්කරවා ගැනීමට අංක '1' ලෙස පවසන්න, වෛද්‍ය උපදෙස් ලබා ගැනීමටනම් අංක '2' ලෙස පවසන්න , ඇඩම්ස් හදුනාගැනීම සදහා අංක '3' ලෙස පවසන්න" 
                elif int(current_time) in range(12, 16): # new user afternoon message of the system
                    answer =  "සුබ දහවලක්, "+response[0]["name"]+" ඔබව පද්ධතියට සාදරයෙන් පිලිගන්නවා. ඔබට මගෙන් වියයුතු සේවාව මින් කුමක්ද? වෛද්‍යවරයෙකු වෙන්කරවා ගැනීමට අංක '1' ලෙස පවසන්න, වෛද්‍ය උපදෙස් ලබා ගැනීමටනම් අංක '2' ලෙස පවසන්න , ඇඩම්ස් හදුනාගැනීම සදහා අංක '3' ලෙස පවසන්න" 
                elif int(current_time) in range(14, 19): # new user evening message of the system
                    answer = "සුබ සැන්දෑවක්, "+response[0]["name"]+ " ඔබව පද්ධතියට සාදරයෙන් පිලිගන්නවා. ඔබට මගෙන් වියයුතු සේවාව මින් කුමක්ද? වෛද්‍යවරයෙකු වෙන්කරවා ගැනීමට අංක '1' ලෙස පවසන්න, වෛද්‍ය උපදෙස් ලබා ගැනීමටනම් අංක '2' ලෙස පවසන්න , ඇඩම්ස් හදුනාගැනීම සදහා අංක '3' ලෙස පවසන්න" 
                elif int(current_time) in range(19, 24):# new user night time message of the system
                    answer = "සුබ රාත්‍රියක්, "+response[0]["name"]+ " ඔබව පද්ධතියට සාදරයෙන් පිලිගන්නවා. ඔබට මගෙන් වියයුතු සේවාව මින් කුමක්ද? වෛද්‍යවරයෙකු වෙන්කරවා ගැනීමට අංක '1' ලෙස පවසන්න, වෛද්‍ය උපදෙස් ලබා ගැනීමටනම් අංක '2' ලෙස පවසන්න , ඇඩම්ස් හදුනාගැනීම සදහා අංක '3' ලෙස පවසන්න" 
             dispatcher.utter_message(text = answer) # Given the output related to the conditions 
             return []

class ActionDoctorType(Action):

     def name(self) -> Text:
         return "action_doctor_type" # action id

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

             response = requests.get("http://127.0.0.1:5000/api/adams").json()  #JSON  data Url

             attempt = response[0]["attempt"] #connect attempt variable with json url varible

             if int(attempt) < 5: #Check loging atttemt of the patient
                 answer = "ඔබට මුනගැසිය යුත්තේ කිනම් රෝගය සම්බන්ධයෙන් වෛද්‍යවරයෙක්ද? උදාහරණයක් ලෙස 'දියවැඩියාව ගැන වෛද්‍යවරයෙකු මුනගැසිය යුතුයි'" #If the patient is new user
             else:
                 answer = "ඔබට මුනගැසිය යුත්තේ කිනම් රෝගය සම්බන්ධයෙන් වෛද්‍යවරයෙක්ද?" #If the patient is old user
             dispatcher.utter_message(text=answer) # Given the output related to the conditions 

             return []

class ActionMeetDoctor(Action):

     def name(self) -> Text:
         return "action_meet_doctor" # action id

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
              
             response = requests.get("http://127.0.0.1:5000/api/adams").json()  #JSON  data Url
             print(response)
             attempt = response[0]["attempt"] #connect attempt variable with json url varible
             if int(attempt) < 5: #Check loging atttemt of the patient
                 answer = "ඔබට හමුවිය හැකි වෛද්‍යවරුන් වන්නේ "+ response[0]["title"]+" උදාහරණයක් ලෙස 'වෛද්‍ය නිමල් කරුනාසේන'" #If the patient is new user
             else:
                 answer = "ඔබට හමුවිය හැකි වෛද්‍යවරුන් වන්නේ"+ response[0]["title"] #If the patient is old user
             dispatcher.utter_message(text= answer) # Given the output related to the conditions

             return []

class ActionDoctorLocation(Action):

     def name(self) -> Text:
         return "action_doctor_location" # action id

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
              
             response = requests.get("http://127.0.0.1:5000/api/adams").json() #JSON  data Url
             print(response)
             attempt = response[0]["attempt"] #connect attempt variable with json url varible
             if int(attempt) < 5: #Check loging atttemt of the patient
                 answer = "ඔබගේ වෛද්‍යවරයා හමුවියහැකි ස්ථානය, දිනය සහ වේලාව මෙසේය. කරුනාකර ඔබ අවශ්‍යය ස්ථානය, දිනය සහ වේලාව පවසන්න ආසිරි රෝහල ගම්පහ සිකුරාදා 8.00-10.00 බණ්ඩාරණායක රෝහල බදාදා වතුපිටිවල 8.00-10.00 උදාහරණයක් ලෙස 'ආසිරි රෝහල ගම්පහ පස්වරු 1.00 සිට පස්වරු 2.00 දක්වා සදුදා දින හමුවිය යුතුය.'" #If the patient is new user
             else:
                 answer = "ඔබගේ වෛද්‍යවරයා හමුවියහැකි ස්ථානය, දිනය සහ වේලාව මෙසේය. කරුනාකර ඔබ අවශ්‍යය ස්ථානය, දිනය සහ වේලාව පවසන්න ආසිරි රෝහල ගම්පහ සිකුරාදා 8.00-10.00 බණ්ඩාරණායක රෝහල බදාදා වතුපිටිවල 8.00-10.00" #If the patient is old user
             dispatcher.utter_message(text= answer) # Given the output related to the conditions

             return []

class ActionApointmentSession(Action):

     def name(self) -> Text:
         return "action_apoint_session" # action id

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

             response = requests.get("http://127.0.0.1:5000/api/adams").json() #JSON  data Url
             

              
             sessionid = "" #Create sessionid variable
             sessionid = response[0]["id"]  #connect attempt variable with json url varible
             
             idvariable = "" #Create sessionid variable
             if sessionid == "1": #If sessionid equals to 1
                 idvariable = "ඔබගේ වෛද්‍ය හමුව වෙන්කරවා ගැනීම සාර්ථකයි ඔබගේ රෝගීන් පරීක්ශා කිරීමේ අංකය වනුයේ 20 කරුණාකර ඔබ වෙන්කරගත් වේලාවට පැමිනීමට කාරුණික වන්න.ඔබට තවදුරටත් මෙම සේවාව පවත්වාගෙන යාමට අවශ්‍යනම් 'අවශ්‍ය' ලෙසද එසේ අවශ්‍ය නොවේනම් 'අවශ්‍ය නොවේ' ලෙසද පවසන්න."
             elif sessionid == "0": #If awaaionid equals to 0
                 idvariable = "කරුණාකර නැවත උත්සාහ කරන්න"
             dispatcher.utter_message(text = idvariable) # Given the output related to the conditions

             return []

class ActionDoctorAppoinmentContinueFlow(Action):

     def name(self) -> Text:
         return "action_doctor_appoinmet_continue_flow" # action id

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

             response = requests.get("http://127.0.0.1:5000/api/adams").json() #JSON  data Url   
             confirm = response[0]["confirm"] #connect confirm variable with json url varible
             if int(confirm) == 1: # If user wants to continue this process
                 answer = "ඔබට මුනගැසිය යුත්තේ කිනම් රෝගය සම්බන්ධයෙන් වෛද්‍යවරයෙක්ද?" 
             else: # If user doen't want to continue this process
                 answer = "වෛද්‍යවරයෙකු වෙන්කරවා ගැනීමට අංක '1' ලෙස පවසන්න, වෛද්‍ය උපදෙස් ලබා ගැනීමටනම් අංක '2' ලෙස පවසන්න , ඇඩම්ස් හදුනාගැනීම සදහා අංක '3' ලෙස පවසන්න"

             dispatcher.utter_message(text=answer) # Given the output related to the conditions

             return []

class ActionDoctorAdvice(Action):

     def name(self) -> Text:
         return "action_doctor_advice" # action id

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
              
             response = requests.get("http://127.0.0.1:5000/api/adams").json() #JSON  data Url   
            
             attempt = response[0]["attempt"] #connect attempt variable with json url varible
             if int(attempt) < 5: #Check loging atttemt of the patient
                 answer = "ඇඩම්ස් මගින් ඔබට රෝගයක් පිලිබදව තොරතුරු දැන ගැනීම,  රෝග විනිශ්චයක් ලබා ගැනීම්, ඖෂධයක් පිලිබද තොරතුරු ලබා ගැනීම වැනි සේවා ලබා ගත හැක. ඒ අනුව ඔබට දැන ගැනීමට අවශ්‍ය වෛද්‍ය උපදේශය කෙටියෙන් සදහන් කරන්න. උදාහරණයක් ලෙස 'මට කොරෝනා රෝගය පිලිබදව දැන ගැනීමට අවශ්‍යයි.'" #If the patient is new user
             else:
                 answer = "ඇඩම්ස් මගින් ඔබට රෝගයක් පිලිබදව තොරතුරු දැන ගැනීම,  රෝග විනිශ්චයක් ලබා ගැනීම්, ඖෂධයක් පිලිබද තොරතුරු ලබා ගැනීම වැනි සේවා ලබා ගත හැක. ඒ අනුව ඔබට දැන ගැනීමට අවශ්‍ය වෛද්‍ය උපදේශය කෙටියෙන් සදහන් කරන්න." #If the patient is old user
             dispatcher.utter_message(text= answer) # Given the output related to the conditions

             return []

class ActionResponseAdvice(Action):

     def name(self) -> Text:
         return "action_response_advice" # action id

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:
              
             response = requests.get("http://127.0.0.1:5000/api/adams").json() #JSON  data Url   
             
             dispatcher.utter_message(text="ඔබ යොමු කල ගැටලුවට අදාල තොරතුරු මෙසේය "+ response[0]["title"]+" ඔබට තවදුරටත් මෙම සේවාව පවත්වාගෙන යාමට අවශ්‍යනම් 'අවශ්‍ය' ලෙසද එසේ අවශ්‍ය නොවේනම් 'අවශ්‍ය නොවේ' ලෙසද පවසන්න.") # Given the output related to the conditions

             return []

class ActionDoctorAdviceContinueFlow(Action):

     def name(self) -> Text:
         return "action_doctor_advice_continue_flow" # action id

     def run(self, dispatcher: CollectingDispatcher,
             tracker: Tracker,
             domain: Dict[Text, Any]) -> List[Dict[Text, Any]]:

             response = requests.get("http://127.0.0.1:5000/api/adams").json() #JSON  data Url   
             
             confirm = response[0]["confirm"] #connect confirm variable with json url varible
             if int(confirm) == 1: # If user wants to continue this process
                 answer = "කරුණාකර ඔබට දැන ගැනීමට අවශ්‍ය වෛද්‍ය උපදෙස ඉදිරිපත් කරන්න"
             else: # If user doen't want to continue this process
                 answer = "වෛද්‍යවරයෙකු වෙන්කරවා ගැනීමට අංක '1' ලෙස පවසන්න, වෛද්‍ය උපදෙස් ලබා ගැනීමටනම් අංක '2' ලෙස පවසන්න , ඇඩම්ස් හදුනාගැනීම සදහා අංක '3' ලෙස පවසන්න"

             dispatcher.utter_message(text=answer) # Given the output related to the conditions

             return []

