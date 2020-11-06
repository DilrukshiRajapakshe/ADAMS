# **Main Component** - Voice to Text Analyzer & Ontology Query development 

*  ## Introduction : Artificial Intelligence based mobile solution to assist Sinhala speaking users to obtain medical advices. ​

*  ## Research Problem : 
*  ####      Lack of English and medical knowledge​ 
*  ####      Poor user experience of mediacl domin mobile systems
*  #### ​     lack of virtual Intelligent agent for Sinhala user

*  ## objective : 
*  ####      The main objective of the proposed system(Determine the Optimum Identification to sort out the Human Medical(Drug and symptom) questionnaire (DOI-HM)) is a mobile solution based on artificial intelligence and to assist Sinhala speaking users in obtaining medical advice.

## **Sub Objectives**
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

## **SSystem Architecture**

##     1.	Developing Virtual agent (ADAMS) - 
#### When we are developing ADAMS, we used the Flutter SDK for mobile app development. It is an SDK to build high-performance, high-accuracy apps for IOS, Android, Web, and desktop from a single codebase. According to the authors of the Handbook of Human Factors in Medical Device Design, the colors which can be easily recognize by humans are red, green, yellow, orange, and blue. So, we used blue and white colour for developing UI of ADAMS [12]. The users are required to have a Google account to access ADAMS. After the user login supported by Google, the app will navigate to the bot interface and the user is recognized by ADAMS. To interact with the system, the users can use either voice or text.  
#### The user's voice (Sinhala voice to text output) is converted to text using speech_to_text 2.3.0 Dart Package. When the patient and ADAMS interact with each other system will generate a session according to the user reactions. The purpose of generating a session is to identify the system's user action and guide new users. If a user did not interact with the system at least 5 times, the system will guide the user. According to the session, the system will address relevant Microservice. Microservice generates a non-analysed result output for user questionnaires and that result will send to the ADAMS. ADAMS will send that to the RASA dialogue framework. The microservice and ADAMS are communicating using REST API. A Webhook API is used to connect ADAMS to RASA framework. This is the process of voice analyser. The user's NIC number and email are validated to avoid creating multiple accounts.

##     2.	Determine the Optimum Identification to sort out the Human Medical(Drug and symptom) questionnaire (DOI-HM) —
#### ADAMS can be used to give instructions to the patients on their questions about diseases, drugs, and side effects. To archive this goal, DOI-HM is developed. The DOI-HM is an Ontology to generate answer to user question. The DOI-HM uses Sinhala Protégé Knowledge Base to answer user questions. The Ontologies knowledge representation language is RDF & OWL. The Apache Jena Fuseki is a SPARQL server and provides a protocol for the query, update, and SPARQL graph store protocol. Figure 3 SPARQL query shows how to retrieve the Individual values of the Ontology.
#### When retrieving information about drugs, WuPalmer algorithm is used to identify a drug name. The proposed system identified a human disease considering the fact Most and Less common and Serious symptoms. DOI-HM is developed in Python. Several Ontology applications use Protégé Knowledge Base, but not done for Sinhala language. This is the first time of developing an Ontology for Sinhala. The easiest way to identify the keywords of a user question is by managing relationships with the classes and Individual values in the Protégé. The Protégé is an object-oriented base Knowledge Base
