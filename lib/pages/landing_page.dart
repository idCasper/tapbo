import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
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
          Center(
            child: Container(
              height: height * 0.13,
              child: Column(
                children: <Widget>[
                  RaisedButton(
                    color: Colors.greenAccent,
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: Text('Login', style: TextStyle(color: Colors.white),),
                  ),
                  RaisedButton(
                    color: Colors.blueAccent,
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    child: Text('Register', style: TextStyle(color: Colors.white),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

