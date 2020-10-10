#### This file contains tests to evaluate that your bot behaves as expected.
#### If you want to learn more, please see the docs: https://rasa.com/docs/rasa/user-guide/testing-your-assistant/

## user appointment
* secretname : කමල්
  - action_register
* start_appoint : අංක එක
  - action_doctor_type
* doctor_type : මට දියවැඩියාව සම්බන්ධයෙන් වෛද්‍යවරයෙකු හමුවීමට අවශ්‍යයයි
  - utter_medi_info
* appoint_doctor : මට වෛද්‍ය නිමල් මුනගැසීමට අවශ්‍යයි
 - action_doctor_location
* appoint_location : ආසිරි රෝහල ගම්පහ පස්වරු 1.00 සිට පස්වරු 2.00 දක්වා සදුදා
 - action_apoint_session
* continue_process : අවශ්‍ය
 - action_continue_flow


## disease identification
* secretname : කමල්
  - action_register
* start_dise : අංක දෙක
  - action_disease_information
* start_dise_infor : මේවා තමයි රෝග ලක්ෂණ
  - utter_disease_identify_info
* continue_process : අවශ්‍ය
  - action_continue_flow


## disease information
* secretname : කමල්
  - action_register
* start_dise_identi : අංක තුන
  - action_ask_disease
* start_dise_name : මේ තමයි රෝගය
  - utter_disease_info
* continue_process : අවශ්‍ය
  - action_continue_flow

## medicine information
* secretname : කමල්
  - action_register
* start_medi : අංක හතර
  - action_ask_medicine
* start_medi_name : මෙය තමයි ඖෂධය
  - utter_drug_info
* continue_process: අවශ්‍ය
  - action_continue_flow

## Rasa information 
* secretname : කමල්
  - action_register
* adams_know : අංක පහ
  - utter_adams_info
* continue_process : අවශ්‍ය
  - action_continue_flow
