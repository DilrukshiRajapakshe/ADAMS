import 'package:adams/Service/UserInfo/Impl/UserInformationImpl.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'UserDetails.dart';

class User_Info extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _User_InfoState();
  }
}

class _User_InfoState extends State<User_Info> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0, height: 2.0,);

  //  text box
  var emailField = TextEditingController();
  var userNameField = TextEditingController();

  var _First_Color = Colors.blue[900];
  var _Second_Color = Colors.blue;

  var myType = new Icon(Icons.mic, color: Colors.blue[900]);

  //speech variable
  bool _hasSpeech = false;
  bool _stressTest = false;
  double level = 0.0;
  int _stressLoops = 0;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";
  final SpeechToText speech = SpeechToText();

  UserInformationImpl info = new UserInformationImpl();

  @override
  Future<void> initState() {
    super.initState();
    // provide language
    initSpeechState();
    getUsername();
    getUserEmails();
  }

  // provide language
  Future<void> initSpeechState() async {
    // if hasSpeech not null - speech plugin is ready
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (hasSpeech) {
      var systemLocale = await speech.systemLocale();
      // provide all other language code
      _currentLocaleId = systemLocale.localeId;
    }
    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
      // Hard code - Sinhala
      _currentLocaleId = "si_LK";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView (
        child :Container(
            color: Colors.white,
            child: SafeArea(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Center(
                                child:Column(
                                    children: [
                                        Column(
                                            children: <Widget>[

                                            Padding(
                                              padding: EdgeInsets.fromLTRB(8, 50, 8, 8),
                                              child: Image.asset(
                                                  'assets/images/logo.png',
                                                  width: 90.0,
                                                  height: 90.0
                                              ),
                                            ),
                                              Text("ADAMS",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.indigo,
                                                  )
                                              )
                                          ]
                                      ),
                                      Column(
                                          children: <Widget>[
                                            Padding (
                                                padding: EdgeInsets.fromLTRB(5, 30, 5, 0),
                                                child : Text("User Information",
                                                  style: TextStyle(
                                                    fontSize: 30,
                                                    fontFamily: 'Georgia',
                                                    color: Colors.indigo,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                )
                                            )
                                          ]
                                      )
                                    ]
                                )
                            )
                          ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child:Column(
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                   Padding(
                                    padding: EdgeInsets.all(8.0),
                                     child:Row(
                                         children: <Widget>[
                                           Expanded(
                                             flex: 9,
                                             child:Padding(
                                               padding: EdgeInsets.all(8.0),
                                               child:Align(
                                                 alignment: Alignment.bottomLeft,
                                                 child:TextField(
                                                   obscureText: false,
                                                   style: style,
                                                   maxLines: null,
                                                   decoration: InputDecoration(
                                                     contentPadding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 0.0),
                                                     prefixIcon: Icon(Icons.person),
                                                     hintText: "Name Of User",
                                                   ),
                                                   controller: userNameField,
                                                 ),
                                               ),
                                             ),
                                           ),
                                           Expanded(
                                             flex: 1,
                                             child:IconButton(
                                               icon: myType,
                                               iconSize: 20,
                                               focusNode: FocusNode(),
                                               onPressed : !_hasSpeech || speech.isListening
                                                   ? null
                                                   : startListening,
                                             ),
                                           ),
                                         ]
                                     ),
                                  ), Padding(
                                    padding: EdgeInsets.all(8.0),
                                      child :TextField(
                                        obscureText: false,
                                        style: style,
                                        decoration: InputDecoration(
                                          prefixIcon: Icon(Icons.email),
                                          contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
                                          hintText: "Email",
                                          enabled: false,
                                        ),
                                      controller: emailField,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 40.0, 5.0, 0.0),
                      child:Column(
                          children: <Widget>[
                            NiceButton(
                              radius: 40,
                              padding: const EdgeInsets.all(10),
                              text: "Next",
                              icon: Icons.arrow_forward,
                              gradientColors: [_First_Color, _Second_Color],
                              onPressed: (){
                                Navigator.of(context).pop();
//                              navigation next page and sending data into next page
                                Route route = MaterialPageRoute(builder: (context) => User_Details(email:emailField.text,name:userNameField.text ));
                                Navigator.push(context, route);
                              },
                            )
                          ]
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }

// ************------------------------ STT started
  void stressTest() {
    if (_stressTest) {
      return;
    }
    _stressLoops = 0;
    _stressTest = true;
    startListening();
  }

  void changeStatusForStress(String status) {
    if (!_stressTest) {
      return;
    }
    if (speech.isListening) {
      stopListening();
    } else {
      if (_stressLoops >= 100) {
        _stressTest = false;
        return;
      }
      ++_stressLoops;
      startListening();
    }
  }

  void startListening() async {
    lastWords = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 20),
        localeId: _currentLocaleId,
        onSoundLevelChange: soundLevelListener,
        cancelOnError: true,
        partialResults: true);
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {
      level = 0.0;
    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords}";
      userNameField.text = lastWords;
    });
  }

  void soundLevelListener(double level) {
    setState(() {
      this.level = level;
    });
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    changeStatusForStress(status);
    setState(() {
      lastStatus = "$status";
    });
  }
// ************------------------------ STT End

  Future<void> getUsername() async {
    String name = await info.getUserName();
    setState(() {
      userNameField.text =name;
    });
  }
  Future<void> getUserEmails() async {
    String email = await info.getUserEmail();
    setState(() {
      emailField.text = email;
    });
  }

}

