import 'package:ashira_flutter/model/Song.dart';
import 'package:ashira_flutter/screens/Sing.dart';
import 'package:flutter/material.dart';

class SongLayout extends StatelessWidget {
  final Song song;

  SongLayout({required this.song});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(backgroundColor:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.transparent;
      })),
      onPressed: () {
        // Navigator.pushNamed(context, '/sing', arguments: {'song':this.song});
        Navigator.push(context, MaterialPageRoute(builder: (_)=>Sing(this.song)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xFF0A999A),
            backgroundBlendMode: BlendMode.colorDodge),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Container(
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                          fit: BoxFit.fill,
                          image: NetworkImage(song.imageResourceFile)))),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      song.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Normal',
                          fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Text(
                        song.artist,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Normal',
                            fontSize: 15),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
