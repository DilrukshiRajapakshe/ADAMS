# ** RASA Framework Development**

*  ## Introduction : By using Rasa framework Identify the Sinhala user quection and generate it relavant answer. ​

*  ## Research Problem : 
*  ####      Lack of English and medical knowledge​ 
*  ####      Poor user experience of mediacl domin mobile systems
*  #### ​     lack of virtual Intelligent agent for Sinhala user

*  ## objective : 
*  ####      The main objective of this dialogue management part is to identify the user question and generate the relevant answer for the user.

## **Sub Objectives**
###     1.	Identify the user question
####        • The main sub-objective is system wants to identify what kind question user tell about the system. That is the important one because understand about user question depend on correctness about system generation answers. In here the user has given his question using the Sinhala language. Because of this system based on Sinhala users. Then want to identify the Sinhala words.

###     2.	Train the Sinhala Data Module
####	    • After identifying the system of the process need to find which intent related question is it. It is needed to create some Sinhala data module for that. This module creates using JSON format. Need to add more data into the data module. Because the user can say one question in different accents when the training module increased step by step, the question accuracy becomes very high in that module.
 
###	3.	Dialogue generating process 
####	    • After identifying the question, the next wants to identify the relevant answer. In here, there are two types of techniques to create the response. Utter is one technique to create a relevant answer. It contains the hardcode. Another technique here is action. It includes the answer which generated the REST API 

###     4.      Connectivity between RASA NLU and RASA Core
####	    • Purpose of the Rasa NLU identifies with relevant user questions. Dialogue Generation part handles using RASA Core. If user, ask questions then identify the intent by using a pre-training model and get a related id for that intent. After that check relevant answer id related to intent id inside the stories.MD file. Using that answer id system will generate the related response for the given user question
 

## **System Architecture**

### User’s given question received for the RASA framework using Webhook API (REST API). That text is taken into the RASA NLU. Markdown format and JSON format are training formats of RASA -NLU. Markdown format is the easiest data training format available in RASA NLU
### In this research, JSON is used as training data format because it is compatible with the mobile application development rather than Markdown format. By using JSON format, system will enrich training data, and it is easy for any developer to read and write. Some power users are interested in Markdown as it is easy to understand for them. 
### This given JSON format will train the model using “common_examples” and all of the training examples include in the “common_examples” array. After moving the text into RASA NLU, it will extract the intents which are inside the sentence. A pipeline is used to identify the intents of the sentence. Pretrained Embeddings and Supervise Embeddings are the two types of pipeline available in this framework. 
### Supervise Embeddings pipeline is used for this research. Because there is no any Sinhala language model. Supervise Embeddings pipeline is the best solution for that problem. In this process Whitespace Tokenizer is available inside the supervise Embedding. Config.yml file can customize the tokenizer. After the intent extraction, the process moves to the RASA CORE. Purpose of this RASA CORE is generating the relevant answer for the user’s question. 
### Utter and Action techniques are used to generate the response. Utter contains the hardcoded answer and Action contains the answer which was generated using the REST API important facts. Both the techniques are used for this research. Utter technique sentences are written in domain.yml file. Before using Action technique, have to start the action server. After generating the relevant answer, Text-to-Speech process will catch it using Webhook API. RASA Stories can handle the conversation. Both intent (question) and Utter or Action (answer) technique were connected by stories.md file. Those stories are written by Markdown format.

## ** Gude line of Run the Project **

### First create python virtual environment to install for the rasa framework.
### Next install Visual Studio 2019 C++ Build Tools.
### Then install rasa framework in that virtual environment using this command “pip install rasa”.
### Next create project inside RASA Framework using “rasa init” command.
### Give the training data nlu.json file(data folder / nlu.json).
### Write action using actions.py file.
### Write utter messages and define intent id, action id using domain.yml file.
### Write story inside stories.md file(data folder /stories.md).
### Train the data using “rasa train” command.
### Run the action server using “rasa run actions”.
### Finally run rasa using “rasa run” command.
 
# Other information

* ## **Group ID** - 2020-175
 
* ## **Research Domain** - Robotics and Intelligent Systems
 
* ## **Supervisor** - Prof. Koliya Pulasinghe

* ## **Co Supervisor** - Ms. Vijani Piyawardana

* ## **Member Details -:**

| IT Number   | Name               |
| ----------- | ------------------ |
| IT17043656  | Nishshanka N.A.B.D |
