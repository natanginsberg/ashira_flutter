class Song {
  String artist;
  String imageResourceFile;
  String songResourceFile;
  String textResourceFile;
  String womanToneResourceFile;
  String kidToneResourceFile;
  int timesDownloaded;
  int timesPlayed;
  String title;
  List<String> lines;
  String genre;
  String songReference;
  String date = "";

  // Song({
  //   this.artist,
  //   this.imageResourceFile,
  //   this.songResourceFile,
  //   this.textResourceFile,
  //   this.timesDownloaded,
  //   this.timesPlayed,
  //   this.title,
  //   this.genre,
  //   this.songReference,
  //   this.womanToneResourceFile,
  //   this.kidToneResourceFile,
  // });

  Song({
    this.artist, this.imageResourceFile, this.title
  });


}
