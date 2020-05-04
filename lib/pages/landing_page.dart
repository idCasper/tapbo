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
  String titleText = 'Cara terbaik untuk belajar bahasa Indonesia';
  String descText = 'Bermain sambil belajar bahasa Indonesia dengan cara yang menyenangkan';
  String btnLoginText = 'Masuk';
  String btnRegisterText = 'Buat akun';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(85, 215, 187, 1),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 50,
            right: 28,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () => changeLanguage('en'),
                  child: Container(
                      width: width * 0.1,
                      height: width * 0.1,
                      decoration: BoxDecoration(
                        color: currentLanguage == 'en' ? Color.fromRGBO(245, 247, 249, 1) : null,
                        border: Border.all(color: Color.fromRGBO(245, 247, 249, 1)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text('EN', style: TextStyle(color: currentLanguage == 'en' ? Color.fromRGBO(85, 215,
    187, 1) : Color.fromRGBO(245, 247, 249, 1), fontWeight: FontWeight.bold),),
                      )
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 8)),
                GestureDetector(
                  onTap: () => changeLanguage('id'),
                  child: Container(
                      width: width * 0.1,
                      height: width * 0.1,
                      decoration: BoxDecoration(
                        color: currentLanguage == 'id' ? Color.fromRGBO(245, 247, 249, 1) : null,
                        border: Border.all(color: Color.fromRGBO(245, 247, 249, 1)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text('ID', style: TextStyle(color: currentLanguage == 'id' ? Color.fromRGBO(85, 215,
    187, 1) : Color.fromRGBO(245, 247, 249, 1),
                            fontWeight: FontWeight.bold),),
                      )
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            width: width,
            height: height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: width * 0.88,
                  height: height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/undraw_speech_to_text.png'),
                      fit: BoxFit.fill
                    )
                  ),
                ),
              ],
            )
          ),
          Positioned(
            bottom: 0,
            width: width,
            height: height * 0.4,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(245, 247, 249, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.05),
                    blurRadius: 10,
                    spreadRadius: 6,
                    offset: Offset(0, -6.0)
                  )
                ]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(28, 28, 28, 12),
                    child: Text(titleText,
                      style: TextStyle(
                        color: Color.fromRGBO(47, 46, 65, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.07,
                      )
                    )
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(28, 0, 28, 32),
                    child: Text(descText, style: TextStyle(color: Colors.black54, fontSize: width * 0.042))
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    width: width,
                    child: RaisedButton(
                      color: Color.fromRGBO(245, 247, 249, 1),
                      onPressed: () => Navigator.pushNamed(context, '/login', arguments: currentLanguage),
                      child: Text(btnLoginText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(85, 215, 187, 1)
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    width: width,
                    child: RaisedButton(
                      color: Color.fromRGBO(85, 215, 187, 1),
                      onPressed: () => Navigator.pushNamed(context, '/register'),
                      child: Text(btnRegisterText,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(245, 247, 249, 1)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  void changeLanguage(String locale) {
    setState(() {
      currentLanguage = locale;
      if(locale == 'id') {
        titleText = 'Cara terbaik untuk belajar bahasa Indonesia';
        descText = 'Bermain sambil belajar bahasa Indonesia dengan cara yang menyenangkan';
        btnLoginText = 'Masuk';
        btnRegisterText = 'Buat akun';
      }else if(locale == 'en') {
        titleText = 'The best way to learn Indonesian';
        descText = 'Play while learning Indonesian in a the best and fun way';
        btnLoginText = 'Log in';
        btnRegisterText = 'Create an account';
      }
    });
  }
}


