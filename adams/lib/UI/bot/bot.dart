import 'dart:async';
import 'package:adams/UserValidation/UserValidation.dart';
import 'package:adams/Session/Appointment.dart';
import 'package:adams/mic-Color/service/ColorServiceImpl.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:adams/UI/sideNav/sideNav.dart';
import 'package:geolocator/geolocator.dart';

void main() => runApp(bot());

class bot extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<bot> {
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
  String _question = "";
  final SpeechToText speech = SpeechToText();
  final Geolocator _geolocatorUser = Geolocator()..forceAndroidLocationManager;
  Position _currentPositionOfUser;
  String _currentAddressOfUser;

  @override
  Future<void> initState() {
    super.initState();
    initSpeechState();
    voicePrinter();
    _getCurrentLocationOfUser();
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


  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
    if (hasSpeech) {
      var systemLocale = await speech.systemLocale();
      _currentLocaleId = systemLocale.localeId;
    }
    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
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
                const SizedBox(height: 80.00),
                Align(
                  child: Text(
                    _question,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 40.00),
                Align(
                  child: Text(
                    lastWords,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 100.00),
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
    if (!speech.isListening && _hasSpeech) {
      if (lastWords != null) {
        _session = await mainRunner(_question, lastWords, _session);
        print(_currentAddressOfUser);
      }
    }
  }

  Future<void> voicePrinter() async {
    String t =  await userValidationInit(_session);
    setState((){
      _question = t;
    });
  }

}
