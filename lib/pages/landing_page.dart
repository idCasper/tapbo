import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final translator = new GoogleTranslator();
  String currentLanguage = 'id';
  String mainTitle = 'Belajar dan Mencoba Berbahasa Indonesia';
  String mainDesc = 'Cara yang mudah untuk belajar Bahasa Indonesia dan melakukan tes Berbahasa Indonesiamu';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xF3F9FFFF),
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              right: 0,
              width: width * 0.7,
              height: height * 0.16,
              child: Image.asset('assets/images/wave.png', fit: BoxFit.fill,)
          ),
          Positioned(
              left: 0,
              bottom: 0,
              width: width * 0.7,
              height: height * 0.3,
              child: Image.asset('assets/images/wave-1.png', fit: BoxFit.fill,)
          ),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 36)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => setState(() {
                      translator.translate(mainTitle, to: 'en').then((s) => setState(() {
                        currentLanguage = 'en';
                        mainTitle = s;
                      }));
                      translator.translate(mainDesc, to: 'en').then((s) => setState(() {
                        mainDesc = s;
                      }));
                    }),
                    child: Container(
                        width: width * 0.1,
                        height: width * 0.1,
                        decoration: BoxDecoration(
                          color: currentLanguage == 'en' ? Colors.greenAccent : null,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text('EN', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        )
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 8)),
                  GestureDetector(
                    onTap: () {
                      translator.translate(mainTitle, to: 'id').then((s) => setState(() {
                        currentLanguage = 'id';
                        mainTitle = s;
                      }));
                      translator.translate(mainDesc, to: 'id').then((s) => setState(() {
                        mainDesc = s;
                      }));
                    },
                    child: Container(
                        width: width * 0.1,
                        height: width * 0.1,
                        decoration: BoxDecoration(
                          color: currentLanguage == 'id' ? Colors.greenAccent : null,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text('ID', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        )
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(right: 8)),
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(mainTitle, style: TextStyle(fontWeight: FontWeight.bold, fontSize: width * 0.08)),
                    ),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(mainDesc, style: TextStyle(color: Colors.black87, fontSize: width * 0.045)),
                    )
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 20,
            child: Container(
              padding: EdgeInsets.all(20),
              width: width,
              child: RaisedButton(
                color: Colors.greenAccent,
                onPressed: () => Navigator.popAndPushNamed(context, '/login'),
                child: Text('Login', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            )
          )
        ],
      ),
    );
  }
}


