## Ontology Query development (Branch - IT16234062)  -: 

*  ## Introduction : Artificial Intelligence based mobile solution to assist Sinhala speaking users to obtain medical advices. ​

*  ## Research Problem : 
*  ####      Lack of English and medical knowledge​ 
*  ####      Poor user experience of mediacl domin mobile systems
*  #### ​     lack of virtual Intelligent agent for Sinhala user

*  ## objective : 
*  ####      The main objective of the proposed system(Determine the Optimum Identification to sort out the Human Medical(Drug and symptom) questionnaire (DOI-HM)) is a mobile solution based on artificial intelligence and to assist Sinhala speaking users in obtaining medical advice.

## **Sub Objectives**
###     Determine the Optimum Identification to sort out the Human Medical(Drug and symptom) questionnaire (DOI-HM) — (Ontology Folder)
####		• REST API genration 
####		• Question identification 
####		• Intent identification 
####		• Decision making
####		• SPARQL Query genration
####		• Responce genration

## **System Architecture**

##     2.	Determine the Optimum Identification to sort out the Human Medical(Drug and symptom) questionnaire (DOI-HM) —
#### ADAMS can be used to give instructions to the patients on their questions about diseases, drugs, and side effects. To archive this goal, DOI-HM is developed. The DOI-HM is an Ontology to generate answer to user question. The DOI-HM uses Sinhala Protégé Knowledge Base to answer user questions. The Ontologies knowledge representation language is RDF & OWL. The Apache Jena Fuseki is a SPARQL server and provides a protocol for the query, update, and SPARQL graph store protocol. Figure 3 SPARQL query shows how to retrieve the Individual values of the Ontology.
#### When retrieving information about drugs, WuPalmer algorithm is used to identify a drug name. The proposed system identified a human disease considering the fact Most and Less common and Serious symptoms. DOI-HM is developed in Python. Several Ontology applications use Protégé Knowledge Base, but not done for Sinhala language. This is the first time of developing an Ontology for Sinhala. The easiest way to identify the keywords of a user question is by managing relationships with the classes and Individual values in the Protégé. The Protégé is an object-oriented base Knowledge Base

#  The gide line of run a project: -
####        • Install the Python (https://www.python.org/downloads/)
####        • Downlode apache-jena-fuseki-3.16.0 (https://jena.apache.org/download/)
####        • Setup PyCharm
####        • Create new flask project
####        • Run pip install -r requirements.txt in terminal
####        • After dependencies download copy the DOI-HM folder inside 'app' folder and past it into DOI-HM folder
####        • Deleted a app.py
####        • Run Controller.py
####        • open terminal and go to apache-jena-fuseki-3.16.0 folder
####        • Run ./fuseki-server --update --mem /adams in terminal

