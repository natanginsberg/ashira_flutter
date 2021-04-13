import 'package:ashira_flutter/model/Song.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sing extends StatefulWidget {
  // Sing({Key key, @required this.song}) : super(key: key);

  @override
  _SingState createState() => _SingState();
}

class _SingState extends State<Sing> {
  Song song;

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    song = data['song'];
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                  ),
                ),
                Text(
                  song.title,
                  style: TextStyle(color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mic,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
