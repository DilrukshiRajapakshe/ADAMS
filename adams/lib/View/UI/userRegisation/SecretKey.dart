import 'package:adams/View/UI/UserValidation/UserValidation.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Secret_Key extends StatefulWidget {

  final String email;
  final String name;
  final String nic;
  final String tel;
  final String bod;
  final String gender;
  Secret_Key({Key key, @required this.email,  @required this.name, @required this.nic, @required this.tel, @required this.bod, @required this.gender}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Secret_KeyState(email:email,name:name,nic:nic,tel:tel,bod:bod,gender:gender);
  }
}

class _Secret_KeyState extends State<Secret_Key> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0, height: 2.0,);

  var secretKey = TextEditingController();

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

  final String email;
  final String name;
  final String nic;
  final String tel;
  final String bod;
  final String gender;
  _Secret_KeyState({@required this.email,  @required this.name, @required this.nic, @required this.tel, @required this.bod, @required this.gender});


  @override
  Future<void> initState() {
    super.initState();
    // provide language
    initSpeechState();
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
                                  child:Align(
                                    alignment: Alignment.bottomLeft,
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
                                                    hintText: "Secret Key",
                                                  ),
                                                  controller: secretKey,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child:IconButton(
                                              icon: new Icon(Icons.mic, color: Colors.blue[900]),
                                              iconSize: 20,
                                              focusNode: FocusNode(),
                                              onPressed : !_hasSpeech || speech.isListening
                                                  ? null
                                                  : startListening,
                                            ),
                                          ),
                                        ]
                                    ),
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
                            text: "Save",
                            icon: Icons.save_alt,
                            gradientColors: [_First_Color, _Second_Color],
                            onPressed: (){
                              Navigator.of(context).pop();
                              Route route = MaterialPageRoute(builder: (context) => Secret_Key_Validation());
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
      secretKey.text = lastWords;
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
}

