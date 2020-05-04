import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool _hasSpeech = false;
  bool _stressTest = false;
  double level = 0.0;
  int _stressLoops = 0;
  String question = "Saya suka makan tomat";
  String answer = "";
  String isCorrect = "";
  String lastError = "";
  String lastStatus = "";
  final SpeechToText speech = SpeechToText();

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);
//    if (hasSpeech) {
//      _localeNames = await speech.locales();

//      var systemLocale = await speech.systemLocale();
//      _currentLocaleId = systemLocale.localeId;
//    }

    if (!mounted) return;

    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    initSpeechState();
    return Scaffold(
      backgroundColor: Color.fromRGBO(85, 215, 187, 1),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -150,
            right: -180,
            height: height * 0.5,
            width: width * 1.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/path6.png'),
                  fit: BoxFit.fill
                )
              ),
            ),
          ),
          Positioned(
            top: 45,
            right: 20,
            height: height * 0.04,
            width: width * 0.25,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/group52.png'),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            height: height * 0.04,
            width: width * 0.098,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/reply.png'),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ),
          Positioned(
            top: 190,
            width: width,
            height: height * 0.067,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Text('Say it Clearly',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: width * 0.05,
                    color: Color.fromRGBO(85, 215, 187, 1)
                  ),
                )
              ),
            ),
          ),
          Positioned(
            top: 270,
            width: width,
            height: height * 0.2,
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text('"$question"',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.07,
                          color: Colors.white,
                        ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 95),
                      child: Text(isCorrect,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.065,
                          color: question == answer ?  Color.fromRGBO(245, 247, 249, 1) : Color.fromRGBO(230, 106, 106,
                              1),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            height: width * 0.42,
            width: width,
            child: Center(
              child: GestureDetector(
                onTap: !_hasSpeech || speech.isListening ? null : startListening,
                child: Container(
                  height: width * 0.42,
                  width: width * 0.42,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/group50.png'),
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: .26,
                        spreadRadius: speech.isListening ? level * 3 : 0,
                        color: Colors.black.withOpacity(.05))
                    ],
                    borderRadius: BorderRadius.circular(100)
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
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
        print("Stress test complete.");
        return;
      }
      print("Stress loop: $_stressLoops");
      ++_stressLoops;
      startListening();
    }
  }

  void startListening() {
    answer = "";
    isCorrect = "";
    lastError = "";
    speech.listen(
        onResult: resultListener,
        listenFor: Duration(seconds: 10),
        localeId: 'in_ID',
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
    answer = result.recognizedWords;
    if(!speech.isListening) {
      question == answer ? isCorrect = 'Correct' : isCorrect = 'Wrong';
      print(answer);
    }
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
}
