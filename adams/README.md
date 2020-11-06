# ----- adams ------
#### This project is a starting point for a Flutter application of ADAMS. Flutter development is taking place on "adams" Flutter mobile application. Artificial Intelligence based mobile solution to assist Sinhala speaking users to make appointments to doctors and to obtain medical advices. 

#  The gide line of run a project: -
####        • Install the flutter (https://flutter.dev/docs/get-started/install?gclid=Cj0KCQiAhZT9BRDmARIsAN2E-J0F0oRgf8uvFEJALLqA_Xf83qonTOpPThRPXmpIBzBRc9EyE6cSpJcaAo2UEALw_wcB&gclsrc=aw.ds)
####        • Setup Android studio or VS code
####        • Open the project
####        • Run flutter pub get in terminal
####        • After dependencies download run  :
####            * cd path/to/flutter/app
####            * flutter run


# README – IT16234062 – D.D.S Rajapakshe

## Voice to Text Analyzer

####        • The Dart files which consists in the "Service/fileReader, /Login, /restService, /Session, /UserInfo" & "View/UI/bot, /login, /sideNav, /SplashScreen, /userRegisation, /UserValidation " packages are regarding this Flutter development under "lib" package.

### Main Objective: - 
####        • Communicate between user and bot using text and voice(communication language is the Sinhala language) and The main objective of the proposed system(Determine the Optimum Identification to sort out the Human Medical(Drug and symptom) questionnaire (DOI-HM))

### Sub Objectives: -	
####        • Voice to text
####		• Sign-In 
####		• Login 
####		• Connection between microservice
####		• Session creation
####		• ADAMS interface development 

## **System Architecture**

##     1.	Developing Virtual agent (ADAMS) - 
#### When we are developing ADAMS, we used the Flutter SDK for mobile app development. It is an SDK to build high-performance, high-accuracy apps for IOS, Android, Web, and desktop from a single codebase. According to the authors of the Handbook of Human Factors in Medical Device Design, the colors which can be easily recognize by humans are red, green, yellow, orange, and blue. So, we used blue and white colour for developing UI of ADAMS [12]. The users are required to have a Google account to access ADAMS. After the user login supported by Google, the app will navigate to the bot interface and the user is recognized by ADAMS. To interact with the system, the users can use either voice or text.  
#### The user's voice (Sinhala voice to text output) is converted to text using speech_to_text 2.3.0 Dart Package. When the patient and ADAMS interact with each other system will generate a session according to the user reactions. The purpose of generating a session is to identify the system's user action and guide new users. If a user did not interact with the system at least 5 times, the system will guide the user. According to the session, the system will address relevant Microservice. Microservice generates a non-analysed result output for user questionnaires and that result will send to the ADAMS. ADAMS will send that to the RASA dialogue framework. The microservice and ADAMS are communicating using REST API. A Webhook API is used to connect ADAMS to RASA framework. This is the process of voice analyser. The user's NIC number and email are validated to avoid creating multiple accounts.


# README – IT17029278 – U.L.N.P. USWATTE

## RASA Plugin and Text-to-Speech Process

####        • The Dart files which consists in the "Service/UserValidation" & "UI" packages are regarding this Flutter development under "lib" package.

### Main Objective: - 
####        • Implement the connection between Flutter mobile application and RASA framework. Sinhala voice output generation and Automated doctor appointment management.

### Sub Objectives: -	
####        • Implementation of Webhook API
####		• Language Translator
####		• User log details and automated appointment saving process
####		• Session management
####		• User validation process
####		• QR code generator
####		• Sinhala Voice output
