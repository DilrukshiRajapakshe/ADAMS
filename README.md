# ----- adams ------
#### This project is a starting point for a Flutter application of ADAMS. Flutter development is taking place on "adams" Flutter mobile application. Artificial Intelligence based mobile solution to assist Sinhala speaking users to make appointments to doctors and to obtain medical advices. 

#  The guidelines to run the project: -
####        • Install the flutter (https://flutter.dev/docs/get-started/install?gclid=Cj0KCQiAhZT9BRDmARIsAN2E-J0F0oRgf8uvFEJALLqA_Xf83qonTOpPThRPXmpIBzBRc9EyE6cSpJcaAo2UEALw_wcB&gclsrc=aw.ds)
####        • Setup the VS code
####        • Open the project
####        • Run flutter pub get in terminal
####        • After dependencies download, run  :
####            * cd path/to/flutter/app
####            * flutter run


# README – IT17029278 – U.L.N.P. USWATTE

## RASA Plugin and Text-to-Speech Process

####        • The Dart files which consists in the "Service/UserValidation" & "UI" packages are regarding this Flutter development under "lib" package.
####        • Python developments are cosists in the "python REST API" folder under "adams" main project structure.


*  ## Objective : 
*  ####       Implement the connection between Flutter mobile application and RASA framework. Sinhala voice output generation and Automated doctor appointment management.

## **Sub Objectives**
####	• Implementation of Webhook API
####	• Python REST API development
####	• Language Translator
####	• User log details and automated appointment saving process
####	• Session management
####	• User validation process
####	• QR code generator
####	• Sinhala Voice output

## **System Architecture**

#### Implementation of a RASA Plugin and Sinhala Text to Speech system consisting of a voice generator synthesizer unit, language translating unit, a plugin between the mobile application and dialogue management, Firebase database query processing unit, user validation process, user log details saving process, session management unit, QR code generator unit, and an automated appointment saving unit. 

#### After the user login to the system using google signing, the user’s entire log details are saved in the database. Check user’s validation using their email. Manage the user’s session during the interaction with the application. Translate the medical answer’s important facts into the Sinhala language. For the translation mechanism, Google English to Sinhala translator plugin will be used. Convert the medical answer into a voice output. Voice output will be generated using the Google Text-to-Speech plugin. 

#### Automatically save the user’s appointment details. After making an appointment a QR code will be generated and this QR code can be saved in the user’s mobile phone as an image. Flutter QR plugins, Image gallery saver plugins, and Screenshot plugins are used for this QR code saving process. Firebase authentication plugins, Cloud Firestore plugins are used for the Firebase query processing developments. These mentioned entire developments are based on the Flutter environment with help of Dart programming language in the “VS Code” source-code editor.

#### Implement a bridge between Flutter mobile application and the dialogue management unit. Above user validation status, user email, logging count, session id, and translated important facts of the medical answer fields should be sent into the RASA process to do Dialogue Management. By creating a Python GET API, these parameters have been sent into the RASA process.  Up and running Python GET API URL is called in Flutter application and necessary parameters are parsed into this REST API.

#### Simultaneously, the user's medical question is sent into the RASA NLU with the aid of the Webhook API. The Python REST API is developed with the support of the Flask framework. Flask plugin is imported in the PyCharm IDEA. Also, this REST API is sent as a POST request method. At the end of the Dialogue Management Process, the medical answer will be received through the Webhook API along with the previous POST request.
