import 'dart:ui';

import 'package:ashira_flutter/customWidgets/SongLayout.dart';
import 'package:ashira_flutter/model/Song.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllSongs extends StatefulWidget {
  @override
  _AllSongsState createState() => _AllSongsState();
}

List<Song> songs = [
  Song(
      artist: "avrham fried",
      imageResourceFile:
          'https://s3.wasabisys.com/playbacks/%D7%90%D7%91%D7%A8%D7%94%D7%9D%20%D7%A4%D7%A8%D7%99%D7%93/%D7%90%D7%91%D7%90/img903052.jpg',
      title: "aleh katan"),
  Song(
      artist: "simcha leiner",
      imageResourceFile:
          'https://s3.wasabisys.com/playbacks/%D7%90%D7%91%D7%A8%D7%94%D7%9D%20%D7%A4%D7%A8%D7%99%D7%93/%D7%90%D7%91%D7%90/img903052.jpg',
      title: "ml"),
  // Song(
  //     artist: "avrham fried",
  //     imageResourceFile:
  //         'https://s3.wasabisys.com/playbacks/%D7%90%D7%91%D7%A8%D7%94%D7%9D%20%D7%A4%D7%A8%D7%99%D7%93/%D7%90%D7%91%D7%90/img903052.jpg',
  //     title: "aleh katan"),
  // Song(
  //     artist: "avrham fried",
  //     imageResourceFile:
  //         'https://s3.wasabisys.com/playbacks/%D7%90%D7%91%D7%A8%D7%94%D7%9D%20%D7%A4%D7%A8%D7%99%D7%93/%D7%90%D7%91%D7%90/img903052.jpg',
  //     title: "aleh katan"),
  // Song(
  //     artist: "avrham fried",
  //     imageResourceFile:
  //         'https://s3.wasabisys.com/playbacks/%D7%90%D7%91%D7%A8%D7%94%D7%9D%20%D7%A4%D7%A8%D7%99%D7%93/%D7%90%D7%91%D7%90/img903052.jpg',
  //     title: "aleh katan"),
  // Song(
  //     artist: "avrham fried",
  //     imageResourceFile:
  //         'https://s3.wasabisys.com/playbacks/%D7%90%D7%91%D7%A8%D7%94%D7%9D%20%D7%A4%D7%A8%D7%99%D7%93/%D7%90%D7%91%D7%90/img903052.jpg',
  //     title: "aleh katan"),
  // Song(
  //     artist: "avrham fried",
  //     imageResourceFile:
  //         'https://s3.wasabisys.com/playbacks/%D7%90%D7%91%D7%A8%D7%94%D7%9D%20%D7%A4%D7%A8%D7%99%D7%93/%D7%90%D7%91%D7%90/img903052.jpg',
  //     title: "aleh katan")
];

List<List<Song>> searchPath = [];
List<Song> gridSongs = new List.from(songs);

bool onSearchTextChanged;

class _AllSongsState extends State<AllSongs> {
  final TextEditingController controller = new TextEditingController();

  String previousValue = "";

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void signInAnon() async {
    await firebaseAuth.signInAnonymously().then((value) => getSongs());
  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   signInAnon();
    // });
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SafeArea(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
              SafeArea(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mic,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 48,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF8D3C8E), width: 2),
                borderRadius: BorderRadius.circular(50),
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    const Color(0xFF221A4D), // blue sky
                    const Color(0xFF000000), // yellow sun
                  ],
                )),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 48,
                    child: Center(
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        controller: controller,
                        decoration: new InputDecoration(
                          hintText: 'Search',
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Colors.transparent,
                        ),
                        onChanged: (String value) {
                          setState(() {
                            // searchPath.add(new List.from(gridSongs));
                            gridSongs = value.length > previousValue.length
                                ? getNextSong(value)
                                : getLastSong();
                            previousValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: new Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      controller.clear();
                      previousValue = "";
                      searchPath.clear();
                      setState(() {
                        gridSongs = List.from(songs);
                      });
                    },
                  ),
                ]),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 0.8,
                  colors: [
                    const Color(0xFF221A4D), // blue sky
                    const Color(0xFF000000), // yellow sun
                  ],
                )),
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: buildGridView(gridSongs)),
          ),
        ],
      ),
    );
  }

  getSongs() {
    FirebaseFirestore.instance
        .collection('songs')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data();
        songs.add(new Song(
            artist: data['artist'],
            title: data['title'],
            imageResourceFile: data['imageResourceFile']));
      });
    });
  }

  buildGridView(List<Song> songs) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 0.6,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: songs.length,
        itemBuilder: (BuildContext ctx, index) {
          return Container(
            alignment: Alignment.center,
            child: SongLayout(song: songs[index]),
          );
        });
  }

  getLastSong() {
    return searchPath.removeLast().toList();
  }

  getNextSong(String value) {
    List<Song> searchedSongs = searchPath.last
        .where((element) =>
            element.title.contains(value) || element.artist.contains(value))
        .toList();
    // ignore: unnecessary_statements
    value.length != 1
        ? searchPath.add(List.from(gridSongs))
        : searchPath.add(List.from(songs));
    return searchedSongs;
  }
}
