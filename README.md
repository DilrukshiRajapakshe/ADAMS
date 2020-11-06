# **Main Component** 

## Introduction : 
####    This paper proposes an Artificial Intelligence based mobile solution to assist Sinhala speaking users to make   appointments to doctors and to obtain medical advices. This Automated Doctor Appointment Management System (ADAMS) consists of Speech Recognition unit, Query Processing unit, Dialog Management unit, Voice Generator synthesizer unit, and User Information Management unit. The ADAMS gets the users’ speech utterances and recognize the language content of it for further processing. Language content is further processed using query processing unit to identify users’ intent. To fulfil the users’ intent, a reply is generated from Dialogue Management Unit. This reply/answer will be delivered to the user by means of a voice synthesizer. The proposed system is successfully implemented using state of the art technology stack including Flutter, Python, Protégé and Firebase. Performance of the system is demonstrated using several sample scenarios/dialogues. ​

## Research Problem : 
*  ####      Lack of English and medical knowledge​ 
*  ####      Poor user experience of mediacl domin mobile systems
*  #### ​     lack of virtual Intelligent agent for Sinhala user
*  #### ​     Poor user experience of e-channeling systems ​
*  #### ​     Poor mobile e-channeling platform for businessman​
*  #### ​     Lack of service providing 24*7​

## objective : 
####      The main objective of the proposed system(Determine the Optimum Identification to sort out the Human Medical(Drug and symptom) questionnaire (DOI-HM)) is a mobile solution based on artificial intelligence and to assist Sinhala speaking users in obtaining medical advice and  make a Doctor Appointment.

## Solution : 
####      Developing an Artificial Intelligence based mobile solution to assist Sinhala speaking users to make appointments to doctors and to obtain medical advices.​

## Sub Objectives :
####        • Voice to Text Analyzer & Ontology Query development
####        • Appointment Management 
####        • Maintaining the Integrity of the Specifications
####        • RASA Framework Development

# **Individual**

## 1. 1st Member (Branch - IT16234062) Voice to Text Analyzer & Ontology Query development-: 

### Introduction : Artificial Intelligence based mobile solution to assist Sinhala speaking users to obtain medical advices. ​

### Research Problem : 
*  ####      Lack of English and medical knowledge​ 
*  ####      Poor user experience of mediacl domin mobile systems
*  #### ​     lack of virtual Intelligent agent for Sinhala user

### objective : 
*  ####      The main objective of the proposed system(Determine the Optimum Identification to sort out the Human Medical(Drug and symptom) questionnaire (DOI-HM)) is a mobile solution based on artificial intelligence and to assist Sinhala speaking users in obtaining medical advice.

### **Sub Objectives**
###     1.	Developing Virtual agent (ADAMS) - (ADAMS Folder)
####        • Voice to text
####		• Sign-In 
####		• Login 
####		• Connection between microservice
####		• Session creation
####		• ADAMS interface development 
###     2.	Determine the Optimum Identification to sort out the Human Medical(Drug and symptom) questionnaire (DOI-HM) — (Ontology Folder)
####		• REST API genration 
####		• Question identification 
####		• Intent identification 
####		• Decision making
####		• SPARQL Query genration
####		• Responce genration

### **System Architecture**

###     1.	Developing Virtual agent (ADAMS) - 
#### When we are developing ADAMS, we used the Flutter SDK for mobile app development. It is an SDK to build high-performance, high-accuracy apps for IOS, Android, Web, and desktop from a single codebase. According to the authors of the Handbook of Human Factors in Medical Device Design, the colors which can be easily recognize by humans are red, green, yellow, orange, and blue. So, we used blue and white colour for developing UI of ADAMS [12]. The users are required to have a Google account to access ADAMS. After the user login supported by Google, the app will navigate to the bot interface and the user is recognized by ADAMS. To interact with the system, the users can use either voice or text.  
#### The user's voice (Sinhala voice to text output) is converted to text using speech_to_text 2.3.0 Dart Package. When the patient and ADAMS interact with each other system will generate a session according to the user reactions. The purpose of generating a session is to identify the system's user action and guide new users. If a user did not interact with the system at least 5 times, the system will guide the user. According to the session, the system will address relevant Microservice. Microservice generates a non-analysed result output for user questionnaires and that result will send to the ADAMS. ADAMS will send that to the RASA dialogue framework. The microservice and ADAMS are communicating using REST API. A Webhook API is used to connect ADAMS to RASA framework. This is the process of voice analyser. The user's NIC number and email are validated to avoid creating multiple accounts.

###     2.	Determine the Optimum Identification to sort out the Human Medical(Drug and symptom) questionnaire (DOI-HM) —
#### ADAMS can be used to give instructions to the patients on their questions about diseases, drugs, and side effects. To archive this goal, DOI-HM is developed. The DOI-HM is an Ontology to generate answer to user question. The DOI-HM uses Sinhala Protégé Knowledge Base to answer user questions. The Ontologies knowledge representation language is RDF & OWL. The Apache Jena Fuseki is a SPARQL server and provides a protocol for the query, update, and SPARQL graph store protocol. Figure 3 SPARQL query shows how to retrieve the Individual values of the Ontology.
#### When retrieving information about drugs, WuPalmer algorithm is used to identify a drug name. The proposed system identified a human disease considering the fact Most and Less common and Serious symptoms. DOI-HM is developed in Python. Several Ontology applications use Protégé Knowledge Base, but not done for Sinhala language. This is the first time of developing an Ontology for Sinhala. The easiest way to identify the keywords of a user question is by managing relationships with the classes and Individual values in the Protégé. The Protégé is an object-oriented base Knowledge Base

## 2. 2nd Member (Branch - IT17255820) Appointment Management-:   

### Introduction : Artificial Intelligence based mobile solution to assist Sinhala speaking users to obtain medical advices. ​

### Research Problem : 
*  ####      Lack of English and medical knowledge​ 
*  ####      Poor user experience of mediacl domin mobile systems
*  #### ​     lack of virtual Intelligent agent for Sinhala user

### objective : 
####      Appointment management process. Have to find intents from the Sinhala question and generate important words that need to create responses regarding identified intents.   

### **Sub Objectives**
###     1.	Natural Language Understanding Process - (MedBot Folder --> Medical Bot)
####        • Divide medical facts from given sentences 
####		• Translate identified all Sinhala and English intents to English   
####		• Generate Query from Identified Facts  
####		• Connection between microservice
###     2.	Medical Data Collection Application  — (MedBot Folder --> mobile-app)

### **System Architecture**

###     1.	Natural Language Understanding Process - 
#### NLP is used to understand questions that are given as Sinhala speech. Initially, Sinhala speech input is converted into Sinhala text and send it to appointment management section.  

###     2.	Medical Data Collection Application —
#### A mobile application is developed for Medical Centre data registration. This application is developed using Flutter, which is platform independent. Therefore, the application can be used in both IOS and in android platforms. 

## 3. 3rd Member (Branch - IT17029278) Maintaining the Integrity of the Specifications-: 

### Introduction : Artificial Intelligence based mobile solution to assist Sinhala speaking users to obtain medical advices. ​

### Research Problem : 
*  ####      There exists a problem where the connectivity between Flutter and the RASA framework is not fulfilled.
*  ####      Existing systems generate Sinhala voice output which is not that smooth or not good in quality and also sometimes not healthier to human beings. Speed has also become an issue for the people when using these types of systems.

### Objective : 
####       Implement the connection between Flutter mobile application and RASA framework. Sinhala voice output generation and Automated doctor appointment management.

### **Sub Objectives**
####	• Implementation of Webhook API
####	• Python REST API development
####	• Language Translator
####	• User log details and automated appointment saving process
####	• Session management
####	• User validation process
####	• QR code generator
####	• Sinhala Voice output

### **System Architecture**

#### Implementation of a RASA Plugin and Sinhala Text to Speech system consisting of a voice generator synthesizer unit, language translating unit, a plugin between the mobile application and dialogue management, Firebase database query processing unit, user validation process, user log details saving process, session management unit, QR code generator unit, and an automated appointment saving unit. 

#### After the user login to the system using google signing, the user’s entire log details are saved in the database. Check user’s validation using their email. Manage the user’s session during the interaction with the application. Translate the medical answer’s important facts into the Sinhala language. For the translation mechanism, Google English to Sinhala translator plugin will be used. Convert the medical answer into a voice output. Voice output will be generated using the Google Text-to-Speech plugin. 

#### Automatically save the user’s appointment details. After making an appointment a QR code will be generated and this QR code can be saved in the user’s mobile phone as an image. Flutter QR plugins, Image gallery saver plugins, and Screenshot plugins are used for this QR code saving process. Firebase authentication plugins, Cloud Firestore plugins are used for the Firebase query processing developments. These mentioned entire developments are based on the Flutter environment with help of Dart programming language in the “VS Code” source-code editor.

#### Implement a bridge between Flutter mobile application and the dialogue management unit. Above user validation status, user email, logging count, session id, and translated important facts of the medical answer fields should be sent into the RASA process to do Dialogue Management. By creating a Python GET API, these parameters have been sent into the RASA process.  Up and running Python GET API URL is called in Flutter application and necessary parameters are parsed into this REST API.

#### Simultaneously, the user's medical question is sent into the RASA NLU with the aid of the Webhook API. The Python REST API is developed with the support of the Flask framework. Flask plugin is imported in the PyCharm IDEA. Also, this REST API is sent as a POST request method. At the end of the Dialogue Management Process, the medical answer will be received through the Webhook API along with the previous POST request.


## 4. 4th Member (Branch - IT17043656) RASA Framework Development-:

### Introduction : By using Rasa framework Identify the Sinhala user quection and generate it relavant answer. ​

## Research Problem : 
*  ####      Lack of English and medical knowledge​ 
*  ####      Poor user experience of mediacl domin mobile systems
*  #### ​     lack of virtual Intelligent agent for Sinhala user

### objective : 
####      The main objective of this dialogue management part is to identify the user question and generate the relevant answer for the user.

### **Sub Objectives**
###     1.	Identify the user question
###     2.	Train the Sinhala Data Module
###	    3.	Dialogue generating process 
###     4.  Connectivity between RASA NLU and RASA Core

### **System Architecture**

### User’s given question received for the RASA framework using Webhook API (REST API). That text is taken into the RASA NLU. Markdown format and JSON format are training formats of RASA -NLU. Markdown format is the easiest data training format available in RASA NLU
### In this research, JSON is used as training data format because it is compatible with the mobile application development rather than Markdown format. By using JSON format, system will enrich training data, and it is easy for any developer to read and write. Some power users are interested in Markdown as it is easy to understand for them. 
### This given JSON format will train the model using “common_examples” and all of the training examples include in the “common_examples” array. After moving the text into RASA NLU, it will extract the intents which are inside the sentence. A pipeline is used to identify the intents of the sentence. Pretrained Embeddings and Supervise Embeddings are the two types of pipeline available in this framework. 
### Supervise Embeddings pipeline is used for this research. Because there is no any Sinhala language model. Supervise Embeddings pipeline is the best solution for that problem. In this process Whitespace Tokenizer is available inside the supervise Embedding. Config.yml file can customize the tokenizer. After the intent extraction, the process moves to the RASA CORE. Purpose of this RASA CORE is generating the relevant answer for the user’s question. 
### Utter and Action techniques are used to generate the response. Utter contains the hardcoded answer and Action contains the answer which was generated using the REST API important facts. Both the techniques are used for this research. Utter technique sentences are written in domain.yml file. Before using Action technique, have to start the action server. After generating the relevant answer, Text-to-Speech process will catch it using Webhook API. RASA Stories can handle the conversation. Both intent (question) and Utter or Action (answer) technique were connected by stories.md file. Those stories are written by Markdown format.
 
## Other information

* #### **Group ID** - 2020-175
 
* #### **Research Domain** - Robotics and Intelligent Systems
 
* #### **Supervisor** - Prof. Koliya Pulasinghe

* #### **Co Supervisor** - Ms. Vijani Piyawardana

* #### **Member Details -:**

| IT Number   | Name               |
| ----------- | ------------------ |
| IT16234062  | D.D.S Rajapakshe   |
| IT17029278  | U.L.N.P. Uswatte   |
| IT17255820  | Kudawithana K.N.B  |
| IT17043656  | Nishshanka N.A.B.D |
