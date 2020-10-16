import 'package:adams/UI/UserValidation/UserValidation.dart';
import 'package:adams/UI/bot/bot.dart';
import 'package:flutter/material.dart';
import 'package:nice_button/nice_button.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Secret_Key_Validation extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return Secret_Key_ValidationState();
  }
}

class Secret_Key_ValidationState extends State<Secret_Key_Validation> {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0, height: 2.0,);

  var secretKey = TextEditingController();

  var _First_Color = Colors.blue[900];
  var _Second_Color = Colors.blue;

  var myType = new Icon(Icons.send, color: Colors.blue[900]);

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
      body: Container (
        child :Container(
          color: Colors.white,
          child: SafeArea(
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                    flex: 8,
                    child:Padding(
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
                                                  'assets/images/robo.png',
                                                  width: 150.0,
                                                  height: 300.0
                                              ),
                                            ),
                                          ]
                                      ),
                                    ]
                                )
                            )
                          ]
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child:Padding(
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
                                    child :Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 8,
                                            child:Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child:Align(
                                                alignment: Alignment.bottomLeft,
                                                child:TextField(
                                                  obscureText: false,
                                                  style: style,
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
                                          ),Expanded(
                                            flex: 1,
                                            child:IconButton(
                                              icon: myType,
                                              iconSize: 20,
                                              onPressed : (){},
                                            ),
                                          ),
                                        ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                      ),
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

