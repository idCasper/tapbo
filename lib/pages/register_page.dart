import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool switchVisible = false;
  String currentLanguage = 'en';

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
            bottom: 0,
            width: width,
            height: height * 0.69,
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(28, 0, 28, 48),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('Join us to PELAS',
                              style: TextStyle(
                                color: Color.fromRGBO(47, 46, 65, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.07,
                              ),),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text('Pembelajaran Bahasa Indonesia',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.05,
                              ),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(28, 0, 28, 12),
                      height: height * 0.06,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(28, 0, 28, 12),
                      height: height * 0.06,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(28, 0, 28, 0),
                      height: height * 0.06,
                      child: TextField(
                        obscureText: !switchVisible,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.vpn_key),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 28),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("Make password visible", style: TextStyle(fontSize: 12, color: Colors.black54),),
                          Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                  value: switchVisible,
                                  onChanged: (value) => setState(() => switchVisible = value)
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(28, 20, 28, 0),
                      width: width,
                      child: RaisedButton(
                        color: Color.fromRGBO(85, 215, 187, 1),
                        onPressed: () => Navigator.popAndPushNamed(context, '/login'),
                        child: Text('Create an account',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(245, 247, 249, 1)
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(28, 8, 28, 70),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text("Already have an account ? ", style: TextStyle(color: Colors.grey),),
                          GestureDetector(
                              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
                              child: Text("Log in", style: TextStyle(fontWeight: FontWeight.w600),)
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }

  void changeLanguage(String locale) {
    setState(() {
      currentLanguage = locale;
      if(locale == 'id') {

      }else if(locale == 'en') {

      }
    });
  }
}
