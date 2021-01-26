import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/screens/home_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 50),
                  Image(image: AssetImage('res/images/banner.png')),
                  titleText,
                  buildLoginButtonWidget(),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: bottomText,
              )
            ],
          ),
        ));
  }

  Widget titleText = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
        'Truyện Cổ Tích Audio',
        style: TextStyle(
          color: Color.fromRGBO(15, 15, 15, 0.86),
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontFamily: 'Pacifico',
        ),
      ));

  Widget bottomText = Container(
    padding: EdgeInsets.only(bottom: 16),
    child: RichText(
      text: TextSpan(
        text: 'Điều Khoản ',
        style: TextStyle(fontSize: 10, color: Color.fromRGBO(171, 54, 17, 1)),
        children: <TextSpan>[
          TextSpan(
              text: 'người dùng và ',
              style: TextStyle(color: Color.fromRGBO(15, 15, 15, 0.86))),
          TextSpan(
              text: 'Bảo mật ',
              style: TextStyle(color: Color.fromRGBO(171, 54, 17, 1))),
          TextSpan(
              text: 'thông tin',
              style: TextStyle(color: Color.fromRGBO(15, 15, 15, 0.86))),
        ],
      ),
    ),
  );

  Widget buildLoginButtonWidget() {
    return Container(
        margin: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: <Widget>[
            RawMaterialButton(
              padding: EdgeInsets.only(right: 80, left: 80),
              fillColor: Color.fromRGBO(30, 86, 42, 1),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const <Widget>[
                    Text(
                      "Facebook",
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            SizedBox(height: 5),
            RawMaterialButton(
              fillColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const <Widget>[
                    Text(
                      "Google",
                      maxLines: 1,
                      style: TextStyle(
                          color: Color.fromRGBO(30, 86, 42, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              shape: StadiumBorder(
                  side: BorderSide(
                      color: Color.fromRGBO(30, 86, 42, 1), width: 1)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],
        ));
  }
}
