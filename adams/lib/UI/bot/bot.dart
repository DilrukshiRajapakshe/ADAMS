import 'package:adams/Session/Dialog.dart';
import 'package:adams/UI/sideNav/sideNav.dart';
import 'package:adams/UserInfo/UserImageURL.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:readmore/readmore.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../UserValidation/firebase_service.dart';
import 'package:adams/UserValidation/firebase_service.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io';

class bot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyBotState();
  }
}

class _MyBotState extends State<bot> {
  TextStyle style = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 15.0,
    height: 2.0,
  );

  var userQuestion = TextEditingController();

  var myType = new Icon(Icons.send, color: Colors.blue[900]);

  //QR code & screenshot varialbles
  var scr = GlobalKey();
  File _imageFile;
  var imageByte;
  StateSetter _setState;
  ScreenshotController _screenshotController = ScreenshotController();
  String _platformVersion = 'Unknown';

  //User validation variables
  String _currentAddressOfUser;
  String userCollectionDocumenId = '';

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

  // text to speech
  final FlutterTts flutterTts = FlutterTts();

  // session
  String _session = "0";
  String _question = question_list_1;
  String userAnswer = "";

  String userImageUrl = "";

  var VisibilityOfRow = false;

  @override
  Future<void> initState() {
    super.initState();
    // provide language
    initSpeechState();
    getUserEmails();
    _speak();
  }

  //user login email and session ID capturing
  void getDocId() async {
    FirebaseServiceSearch ss = new FirebaseServiceSearch();
    print('getDocId, ${userCollectionDocumenId}');
    userCollectionDocumenId =
        await ss.checkDataByEmail('adames.medi@gmail.com', 2);
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue[900]),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ADAMS'),
        ),
        backgroundColor: Colors.white,
        drawer: SideNav(),
        body: Container(
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      flex: 17,
                      child: Center(
                        child: SingleChildScrollView(
                          child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(children: [
                                    SingleChildScrollView(
                                      child: Container(
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                            Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Container(
                                                  child: Column(children: [
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Expanded(
                                                            flex: 1,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          0,
                                                                          8,
                                                                          0,
                                                                          0),
                                                              child: new Container(
                                                                  width: 45.0,
                                                                  height: 50.0,
                                                                  decoration: new BoxDecoration(
                                                                      shape: BoxShape.circle,
                                                                      image: new DecorationImage(
                                                                        fit: BoxFit
                                                                            .fill,
                                                                        image:
                                                                            new ExactAssetImage(
                                                                          'assets/images/robo.png',
                                                                        ),
                                                                      ))),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 9,
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          8,
                                                                          8,
                                                                          8,
                                                                          8),
                                                              child: Card(
                                                                shape:
                                                                    RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                  side: BorderSide(
                                                                      width:
                                                                          0.5,
                                                                      color: Colors
                                                                              .blue[
                                                                          900]),
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: <
                                                                      Widget>[
                                                                    Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              15),
                                                                      child:
                                                                          ReadMoreText(
                                                                        _question,
                                                                        trimLines:
                                                                            12,
                                                                        colorClickableText:
                                                                            Colors.blue[900],
                                                                        trimMode:
                                                                            TrimMode.Line,
                                                                        trimCollapsedText:
                                                                            '...Show more',
                                                                        trimExpandedText:
                                                                            ' show less',
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                  ]),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(2.0),
                                                child: Container(
                                                  child: Column(children: [
                                                    Visibility(
                                                      visible: VisibilityOfRow,
                                                      child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Expanded(
                                                              flex: 9,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            8,
                                                                            8,
                                                                            8,
                                                                            8),
                                                                child: Card(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    side: BorderSide(
                                                                        width:
                                                                            0.5,
                                                                        color: Colors
                                                                            .blue[900]),
                                                                  ),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <
                                                                        Widget>[
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.all(15),
                                                                        child:
                                                                            ReadMoreText(
                                                                          userAnswer,
                                                                          trimLines:
                                                                              12,
                                                                          colorClickableText:
                                                                              Colors.blue[900],
                                                                          trimMode:
                                                                              TrimMode.Line,
                                                                          trimCollapsedText:
                                                                              '...Show more',
                                                                          trimExpandedText:
                                                                              ' show less',
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            0),
                                                                child: new Container(
                                                                    width: 45.0,
                                                                    height: 43.0,
                                                                    decoration: new BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        image: new DecorationImage(
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          image:
                                                                              new NetworkImage(userImageUrl),
                                                                        ))),
                                                              ),
                                                            ),
                                                          ]),
                                                    ),
                                                  ]),
                                                ),
                                              ),
                                            ),
                                          ])),
                                    ),
                                  ]),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Center(
                                  child: Align(
                                      child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Container(
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                side: BorderSide(
                                                    width: 0.5,
                                                    color: Colors.blue[900]),
                                              ),
                                              child: Column(children: <Widget>[
                                                Align(
                                                  child: Row(children: <Widget>[
                                                    Expanded(
                                                      flex: 8,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .bottomLeft,
                                                          child: TextField(
                                                            obscureText: false,
                                                            style: style,
                                                            maxLines: null,
                                                            decoration:
                                                                InputDecoration(
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .fromLTRB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          0.0),
                                                            ),
                                                            controller:
                                                                userQuestion,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: IconButton(
                                                        icon: new Icon(
                                                            Icons.mic,
                                                            color: Colors
                                                                .blue[900]),
                                                        iconSize: 20,
                                                        focusNode: FocusNode(),
                                                        onPressed: !_hasSpeech ||
                                                                speech
                                                                    .isListening
                                                            ? null
                                                            : startListening,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: IconButton(
                                                        icon: myType,
                                                        iconSize: 20,
                                                        onPressed: () {
                                                          send();
                                                          userQuestion.clear();
                                                        },
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ]),
                                            ),
                                          ]),
                                    ),
                                  )),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //QR code generation & configuration
  Widget showQr(BuildContext context, var data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            _setState = setState;
            return Container(
              width: 500.0,
              height: 500.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RepaintBoundary(
                    key: scr,
                    child: QrImage(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      data: data,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      RaisedButton(
                          child: Text('Save'),
                          onPressed: () async {
                            print('save clicked');
                            print('save over');
                            //get screen shot of qr image and save in gallery
                            await takescrshot();
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  //QR code saving as an Image
  takescrshot() async {
    RenderRepaintBoundary boundary = scr.currentContext.findRenderObject();
    var image = await boundary.toImage(pixelRatio: 2);
    print('img - $image');
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    Uint8List pngBytes = byteData.buffer.asUint8List();

    // _setState(() {
    //   imageByte = byteData.buffer.asUint8List();
    //
    // });

    print(pngBytes);

    var directory = await getApplicationDocumentsDirectory();

    String fileName = DateTime.now().toIso8601String();
    String path = '${directory.path}/$fileName.png';

    File file = File(path);
    await file.writeAsBytesSync(pngBytes);

    print('file pathhh - ${file.path}');

    // code of read or write file in external storage (SD card)
    final result = await ImageGallerySaver.saveImage(pngBytes);

    print('result - $result');
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
      userQuestion.text = lastWords;
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

// ************------------------------ TTS started
  Future _speak() async {
    await flutterTts.setLanguage("si-LK");
    await flutterTts.setPitch(1);
    await flutterTts.speak(_question);
  }
// ************------------------------ TTS end

  Future<void> send() async {
    String a = "";
    var v = false;
    if (userQuestion.text != null) {
      a = userQuestion.text;
      v = true;
    }
    setState(() {
      userAnswer = a;
      VisibilityOfRow = v;
    });
  }

  Future<void> getUserEmails() async {
    String url = await getUserImageURL();
    setState(() {
      userImageUrl = url;
    });
  }
}
