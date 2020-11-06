README – IT17043656 – N.A.B.D. Nishshanka

Dialogue Generation Process

Main objective

The main objective of this dialogue management part is to identify the user question and generate the relevant answer for the user.



Sub objectives


Identify the user question

The main sub-objective is system wants to identify what kind question user tell about the system. That is the important one because understand about user question depend on correctness about system generation answers. In here the user has given his question using the Sinhala language. Because of this system based on Sinhala users. Then want to identify the Sinhala words.


Train the Sinhala Data Module

After identifying the system of the process need to find which intent related question is it. It is needed to create some Sinhala data module for that. This module creates using JSON format. Need to add more data into the data module. Because the user can say one question in different accents when the training module increased step by step, the question accuracy becomes very high in that module.


Dialogue generating process

After identifying the question, the next wants to identify the relevant answer. In here, there are two types of techniques to create the response. Utter is one technique to create a relevant answer. It contains the hardcode. Another technique here is action. It includes the answer which generated the REST API


Connectivity between RASA NLU and RASA Core

Purpose of the Rasa NLU identifies with relevant user questions. Dialogue Generation part handles using RASA Core. If user, ask questions then identify the intent by using a pre-training model and get a related id for that intent. After that check relevant answer id related to intent id inside the stories.MD file. Using that answer id system will generate the related response for the given user question




Process of dialogue management in RASA framework windows 10


•   First create python virtual environment to install for the rasa framework.
•   Next install Visual Studio 2019 C++ Build Tools.
•   Then install rasa framework in that virtual environment using this command “pip install rasa”.
•   Next create project inside RASA Framework using “rasa init” command.
•   Give the training data nlu.json file(data folder / nlu.json).
•   Write action using actions.py file.
•   Write utter messages and define intent id, action id using domain.yml file.
•   Write story inside stories.md file(data folder /stories.md).
•   Train the data using “rasa train” command.
•   Run the action server using “rasa run actions”.
•   Finally run rasa using “rasa run” command.



