import 'dart:async';

import 'package:flutter/material.dart';

class Promo extends StatefulWidget {
  @override
  _PromoState createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1),
        () => Navigator.pushReplacementNamed(context, '/allSongs'));
    return Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            const Color(0xFF221A4D), // blue sky
            const Color(0xFF000000), // yellow sun
          ],
        )),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets/ashira.png'),
              fit: BoxFit.fill,
            ),
            Text(
              'Ashira',
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontFamily: 'Logo',
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Jewish Karaoke App',
              style: TextStyle(
                  color: Color(0x99FFFFFF),
                  fontSize: 25,
                  fontFamily: 'Normal',
                  letterSpacing: 1.5),
            ),
            Row(children: []),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 40.0,
              width: 40.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/acum-logo.jpg'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
              child: FlatButton(
                onPressed: () {},
                child: Text(""),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Copyright with ACUM',
              style: TextStyle(color: Color(0x80FFFFFF), fontSize: 18),
            )
          ],
        ));
  }
}
