import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool switchVisible = false;

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
            left: 20,
            top: 60,
            child: Text('Login',
              style: TextStyle(
                  color: Color.fromRGBO(49, 39, 79, 1),
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            width: width * 0.7,
            height: height * 0.3,
            child: Image.asset('assets/images/wave-1.png', fit: BoxFit.fill,)
          ),
          Center(
            child: SizedBox(
              width: width * 0.9,
              height: height * 0.37,
              child: Card(
                color: Color(0xF3F9FFFF),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0, right: 8, bottom: 0, left: 8),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            obscureText: !switchVisible,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.vpn_key),
                              labelText: 'Password',
                            ),
                          ),
                          Row(
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
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 0, right: 8, bottom: 8, left: 8),
                      child: RaisedButton(
                        color: Colors.greenAccent,
                        onPressed: () => Navigator.popAndPushNamed(context, '/home'),
                        child: Text('Login', style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Don't have an account ? ", style: TextStyle(color: Colors.grey),),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(context, '/register'),
                          child: Text("Register", style: TextStyle(fontWeight: FontWeight.w600),)
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
