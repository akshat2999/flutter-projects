import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:musicplayer/SizeConfig.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

  List musicList = [
    {
      'title': "title",
      'imageUrl': "https://picsum.photos/250?image=9",
      'song': "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
    },
    {
      'title': "title2",
      'imageUrl': "https://picsum.photos/250?image=8",
      'song': "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
    },
  ];

  Widget listViewTile({String songName, String imageUrl, String singer, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        width: SizeConfig.screenWidth,
        child: Row(
          children: [
            new Image.network(
              imageUrl,
              width: 80,
              height: 80,
            ),
            Text(singer),
          ],
        ),
      ),
    );
  }

  bool isPlaying = false;
  String currentTitle = "";
  String currentSong = "";
  IconData iconButton = Icons.play_arrow;
  void playSong(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
      }
    }

    audioPlayer.play(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Music Player"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: musicList.length,
                itemBuilder: (context, i) => listViewTile(
                  songName: musicList[i]['title'],
                  imageUrl: musicList[i]['imageUrl'],
                  singer: musicList[i]['title'],
                  onTap: () {
                    setState(() {
                      playSong(musicList[i]['song']);
                      currentTitle = musicList[i]['title'];
                      currentSong = musicList[i]['song'];
                    });
                  },
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  Slider.adaptive(
                    value: 0.0,
                    onChanged: (value) {},
                  ),
                  Row(
                    children: [
                      Text(currentTitle),
                      IconButton(
                        icon: Icon(iconButton),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
