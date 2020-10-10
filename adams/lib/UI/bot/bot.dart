import 'dart:async';
import 'package:adams/Session/Dialog.dart';
import 'package:adams/Session/Appointment.dart';
import 'package:adams/mic-Color/service/ColorServiceImpl.dart';
import 'package:adams/restService/restServiceImpl.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:adams/UI/sideNav/sideNav.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(bot());

class bot extends StatefulWidget {
  @override
  _MyBotState createState() => _MyBotState();
}

class _MyBotState extends State<bot> {
  bool _hasSpeech = false;
  bool _stressTest = false;
  double level = 0.0;
  int _stressLoops = 0;
  String lastWords = "";
  String lastError = "";
  String lastStatus = "";
  String _currentLocaleId = "";

  var colorOf = Colors.purple[600];
  String _session = "0";
  String _question = question_list_1;
  final SpeechToText speech = SpeechToText();
  final Geolocator _geolocatorUser = Geolocator()..forceAndroidLocationManager;
  Position _currentPositionOfUser;
  String _currentAddressOfUser;
  final FlutterTts flutterTts = FlutterTts();


  @override
  Future<void> initState() {
    super.initState();
    initSpeechState();
    _getCurrentLocationOfUser();
    _speak();
  }
//location-01
  _getCurrentLocationOfUser() {
    _geolocatorUser.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position positionOfUser) {
      setState(() {
        _currentPositionOfUser = positionOfUser;
      });
      _getCurrentAddressOfUser();
    }).catchError((ex) {
      print(ex);
    });
  }
//location-02
  _getCurrentAddressOfUser() async {
    try {
      List<Placemark> place = await _geolocatorUser.placemarkFromCoordinates(_currentPositionOfUser.latitude, _currentPositionOfUser.longitude);
      Placemark placeOfUser = place[0];
      setState(() {
        _currentAddressOfUser = "${placeOfUser.locality}, ${placeOfUser.country}";
      });
    } catch (ex) {
      print(ex);
    }
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
    ColorServiceImpl c = new ColorServiceImpl();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purple[600]),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ADAMS'),
        ),
        drawer: SideNav(),
        body: Column(children: [
          Expanded(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20.00),
                Align(
                  child: Text(
                    lastWords,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 10.00),
                Align(
                  child: Text(
                    _question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(height: 10.00),
              ],
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          child: Align(
            child: Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: .26,
                      spreadRadius: level * 1.5,
                      color: Colors.purple.withOpacity(0.5))
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.mic,
                  color: colorOf,
                ),
              ),
            ),
          ),
          onPressed: !_hasSpeech || speech.isListening ? null : startListening,
          tooltip: 'ADAMS',
          backgroundColor: Colors.white,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

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
    });
    printText();
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

  Future<void> printText() async {
    String k = "";
    String t = "";

    if (!speech.isListening && _hasSpeech) {
      if (lastWords != null ) {
        t = mainRunnerSession(lastWords, _session);
        String l = mainRunner(lastWords, _session);
        var client = new http.Client();
        l = mainRunner( lastWords, _session);
        k = await getRASA(client, lastWords);
        _speak();
      }
    }
    setState((){
      _question = k;
      _session = t;
    });
  }

  void test(){

  }

  Future _speak() async {
    await flutterTts.setLanguage("si-LK");
    await flutterTts.setPitch(1);
    await flutterTts.speak(_question);
  }

}
