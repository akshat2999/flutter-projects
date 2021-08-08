import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';
import 'package:sample/SizeConfig.dart';

// ignore: must_be_immutable
class PlayistScreen extends StatefulWidget {
  int num;
  PlayistScreen(this.num);

  @override
  _PlayistScreenState createState() => _PlayistScreenState();
}

class _PlayistScreenState extends State<PlayistScreen> {
  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);

  List emotionList = ["happy", "sad", "neutral", "suprise", "angry", "disgust"];
  static const List happyList = [
    {
      'title': "LAMBORGHINI ",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/lamborgini.jpg?alt=media&token=b0c81ffe-c030-4c4e-91cb-6cff5e7819bc ",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Lamberghini%20(Full%20Video)%20_%20The%20Doorbeen%20Feat%20Ragini%20_%20Latest%20Punjabi%20Song%202018%20_%20Speed%20Records.mp3?alt=media&token=04294889-d4c1-4196-822d-dd3f90bd3e05"
    },
    {
      'title': "matargashti  ",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/matargashti.jpg?alt=media&token=af9f14fa-f249-4c1f-a63e-2da49dcb552b",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/MATARGASHTI%20full%20VIDEO%20Song%20_%20TAMASHA%20Songs%202015%20_%20Ranbir%20Kapoor%2C%20Deepika%20Padukone%20_%20T-Series.mp3?alt=media&token=6f5a19c5-4dc3-445f-9227-8b0dc5a61b21",
    },
    {
      'title': "Happy",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/happy.jpg?alt=media&token=8f777f5c-d732-4408-9c08-26443e7fc79d",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Pharrell%20Williams%20-%20Happy%20(Official%20Music%20Video).mp3?alt=media&token=b21ab748-3565-4f1a-a925-e27ea46ffd17",
    },
    {
      'title': "Uptown Funk",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Uptown%20Funk.jpg?alt=media&token=002e77b0-1b32-4649-9150-fb99bfccbddf",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Mark%20Ronson%20-%20Uptown%20Funk%20(Official%20Video)%20ft.%20Bruno%20Mars.mp3?alt=media&token=dc1d86d3-ba24-4781-a7d4-2a445b5bb6fa",
    },
    {
      'title': "Firework  ",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Firework.jpg?alt=media&token=ce0c225e-4700-4dd9-b102-ae2cd6091c62",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Katy%20Perry%20-%20Firework%20(Lyrics).mp3?alt=media&token=0216c1cd-82bd-48da-a34c-575b51b07739",
    },
    {
      'title': " Can't Stop the Feeling!",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Can't%20Stop%20the%20Feeling!.jpg?alt=media&token=1cf1ca7a-0c99-4637-afc6-b828f9d2fab3",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/CAN'T%20STOP%20THE%20FEELING!%20(From%20DreamWorks%20Animation's%20_Trolls_)%20(Official%20Video).mp3?alt=media&token=3f802e43-c28e-4431-84dd-f4d17a65fd59 ",
    },
  ];
  static const List sadList = [
    {
      'title': "Exile ",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/sad%2FExile.jpg?alt=media&token=fe6dde3d-efff-4698-848f-9ea483c6d0fb",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/sad%2FExile%20(Lyrics)%20Ft.%20Bon%20Iver.mp3?alt=media&token=cdb66ef6-24a3-4456-8e25-6872d2f671b3"
    },
    {
      'title': "Tu hai k nahi",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/sad%2Ftu%20h%20k%20nahi.jpg?alt=media&token=bff27cba-3b93-41c4-b53d-a08ac13fc3ba",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/sad%2F'Tu%20Hai%20Ki%20Nahi'%20FULL%20VIDEO%20Song%20_%20Roy%20_%20Ankit%20Tiwari%20_%20Ranbir%20Kapoor%2C%20Jacqueline%20Fernandez%2C%20Tseries.mp3?alt=media&token=877b4ace-56fa-442b-be88-3d8ebad0798e",
    },
    {
      'title': "No Time to Die",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/sad%2FNo%20Time%20to%20Die.jpg?alt=media&token=c43a2406-c4d0-4e42-8339-8ca16d386f02",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/sad%2FNo%20Time%20To%20Die.mp3?alt=media&token=b76641a9-aeb5-463c-8643-b4de88894331"
    },
    {
      'title': "Lonely",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/sad%2FLonely.jpg?alt=media&token=4fdb84d7-7d83-4442-bd01-2d2f3a0c03cc",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/sad%2FLonely%20(Official%20Music%20Video).mp3?alt=media&token=dbd98e4b-c4f5-448c-8070-c518b616bc20"
    },
  ];
  static const List neutralList = [
    {
      'title': "There is nothing holding me",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2Fthere%20is%20nothing%20holding.jpg?alt=media&token=71cad7e7-2b0a-4fa5-a90b-a07d3c9fb464",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2FShawn%20Mendes%20-%20There's%20Nothing%20Holdin'%20Me%20Back.mp3?alt=media&token=e5ee0346-362a-4c08-bbe0-308db2f218db",
    },
    {
      'title': "Mercy",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2Fmercy.jpg?alt=media&token=9638d401-e8a2-4cbd-8fc3-4c1f1d40617e",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2FShawn%20Mendes%20-%20Mercy.mp3?alt=media&token=eabfb6d3-139b-4a55-bfe7-5e5605c663f9",
    },
    {
      'title': "how long",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2Fhow%20long.jpg?alt=media&token=a20d2d02-ca17-4cc2-916b-615a637cd9e2",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2FCharlie%20Puth%20-%20_How%20Long_%20_Official%20Video_.mp3?alt=media&token=bfab2996-e4c2-4918-9f58-2311b2a6bf4d",
    },
    {
      'title': "do you know",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2Fdo%20u%20know.jpg?alt=media&token=2cc561eb-b8d3-40e0-9a7a-fe0d5dd046ba",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2FDiljit%20Dosanjh%20-%20Do%20You%20Know.mp3?alt=media&token=fbf4bdb0-0a56-4a83-bb4b-47e2238704f0",
    },
  ];
  static const List angryList = [
    {
      'title': "Till I Collapse",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/angry%2FTill%20I%20Collapse.jpg?alt=media&token=51d1882f-c8b9-48cf-8dac-9a1f5dabca0d",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/angry%2FEminem%20-%20Till%20I%20Collapse%20_HD_.mp3?alt=media&token=e0f8f5be-b0c2-481b-8b61-4034d9b74581",
    },
    {
      'title': "Without Me",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/angry%2FWithout%20Me.jpg?alt=media&token=b32f2679-3aae-40d4-9942-f6ec823a999c",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/angry%2FEminem%20-%20Without%20Me%20(Official%20Music%20Video).mp3?alt=media&token=c0e5eb68-8c73-4bb6-a44e-8ce0ae7d0858",
    },
    {
      'title': "Bury a friend",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/angry%2FBury%20A%20Friend.jpg?alt=media&token=f9af51d1-e8f1-4711-92e3-f7d86c034035",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/angry%2FBillie%20Eilish%20-%20bury%20a%20friend.mp3?alt=media&token=e89968c0-b81d-40cc-a9cb-1ef43669e448",
    },
    {
      'title': "Mein",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/angry%2Fmein.jpg?alt=media&token=5423b2ea-5439-49f3-9bc2-b7ade8b1de95",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/angry%2FEMIWAY-MEIN%20(OFFICIAL%20MUSIC%20VIDEO).mp3?alt=media&token=34048792-a897-4ee6-a826-8d362c0a5e01",
    },
  ];
  static const List suprisedList = [
    {
      'title': "Uptown Funk",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Uptown%20Funk.jpg?alt=media&token=002e77b0-1b32-4649-9150-fb99bfccbddf",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Mark%20Ronson%20-%20Uptown%20Funk%20(Official%20Video)%20ft.%20Bruno%20Mars.mp3?alt=media&token=dc1d86d3-ba24-4781-a7d4-2a445b5bb6fa",
    },
    {
      'title': " Can't Stop the Feeling!",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Can't%20Stop%20the%20Feeling!.jpg?alt=media&token=1cf1ca7a-0c99-4637-afc6-b828f9d2fab3",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/CAN'T%20STOP%20THE%20FEELING!%20(From%20DreamWorks%20Animation's%20_Trolls_)%20(Official%20Video).mp3?alt=media&token=3f802e43-c28e-4431-84dd-f4d17a65fd59 ",
    },
    {
      'title': "There is nothing holding me",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2Fthere%20is%20nothing%20holding.jpg?alt=media&token=71cad7e7-2b0a-4fa5-a90b-a07d3c9fb464",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2FShawn%20Mendes%20-%20There's%20Nothing%20Holdin'%20Me%20Back.mp3?alt=media&token=e5ee0346-362a-4c08-bbe0-308db2f218db",
    },
    {
      'title': "do you know",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2Fdo%20u%20know.jpg?alt=media&token=2cc561eb-b8d3-40e0-9a7a-fe0d5dd046ba",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2FDiljit%20Dosanjh%20-%20Do%20You%20Know.mp3?alt=media&token=fbf4bdb0-0a56-4a83-bb4b-47e2238704f0",
    },
    {
      'title': "how long",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2Fhow%20long.jpg?alt=media&token=a20d2d02-ca17-4cc2-916b-615a637cd9e2",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2FCharlie%20Puth%20-%20_How%20Long_%20_Official%20Video_.mp3?alt=media&token=bfab2996-e4c2-4918-9f58-2311b2a6bf4d",
    },
  ];
  static const List disgustList = [
    {
      'title': "Uptown Funk",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Uptown%20Funk.jpg?alt=media&token=002e77b0-1b32-4649-9150-fb99bfccbddf",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Mark%20Ronson%20-%20Uptown%20Funk%20(Official%20Video)%20ft.%20Bruno%20Mars.mp3?alt=media&token=dc1d86d3-ba24-4781-a7d4-2a445b5bb6fa",
    },
    {
      'title': " Can't Stop the Feeling!",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/Can't%20Stop%20the%20Feeling!.jpg?alt=media&token=1cf1ca7a-0c99-4637-afc6-b828f9d2fab3",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/CAN'T%20STOP%20THE%20FEELING!%20(From%20DreamWorks%20Animation's%20_Trolls_)%20(Official%20Video).mp3?alt=media&token=3f802e43-c28e-4431-84dd-f4d17a65fd59 ",
    },
    {
      'title': "There is nothing holding me",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2Fthere%20is%20nothing%20holding.jpg?alt=media&token=71cad7e7-2b0a-4fa5-a90b-a07d3c9fb464",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2FShawn%20Mendes%20-%20There's%20Nothing%20Holdin'%20Me%20Back.mp3?alt=media&token=e5ee0346-362a-4c08-bbe0-308db2f218db",
    },
    {
      'title': "do you know",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2Fdo%20u%20know.jpg?alt=media&token=2cc561eb-b8d3-40e0-9a7a-fe0d5dd046ba",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2FDiljit%20Dosanjh%20-%20Do%20You%20Know.mp3?alt=media&token=fbf4bdb0-0a56-4a83-bb4b-47e2238704f0",
    },
    {
      'title': "how long",
      'imageUrl':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2Fhow%20long.jpg?alt=media&token=a20d2d02-ca17-4cc2-916b-615a637cd9e2",
      'song':
          "https://firebasestorage.googleapis.com/v0/b/mldemo-a571e.appspot.com/o/neutral%2FCharlie%20Puth%20-%20_How%20Long_%20_Official%20Video_.mp3?alt=media&token=bfab2996-e4c2-4918-9f58-2311b2a6bf4d",
    },
  ];

  List chooseList(int n) {
    if (n == 0) return happyList;
    if (n == 1) return sadList;
    if (n == 2) return neutralList;
    if (n == 3) return suprisedList;
    if (n == 4) return angryList;
    return disgustList;
  }

  Widget listViewTile({String songName, String imageUrl, String singer, onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(10),
        width: SizeConfig.screenWidth,
        child: Row(
          children: [
            OctoImage.fromSet(
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                imageUrl,
              ),
              octoSet: OctoSet.circularIndicatorAndIcon(),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    singer,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool isPlaying = false;
  bool isFirst = true;
  String currentTitle = "";
  String currentImg = "";
  String currentSong = "";

  IconData iconButton = Icons.pause_sharp;
  Duration duration = new Duration();
  Duration position = new Duration();

  void playSong(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isFirst = false;
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isFirst = false;
          isPlaying = true;
        });
      }
    }

    audioPlayer.play(url);
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              audioPlayer.stop();
              Navigator.of(context).pop();
            },
          ),
          title: Text(emotionList[widget.num].toString()),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chooseList(widget.num).length,
                itemBuilder: (context, i) => listViewTile(
                  songName: chooseList(widget.num)[i]['title'],
                  imageUrl: chooseList(widget.num)[i]['imageUrl'],
                  singer: chooseList(widget.num)[i]['title'],
                  onTap: () {
                    setState(() {
                      playSong(chooseList(widget.num)[i]['song']);
                      currentTitle = chooseList(widget.num)[i]['title'];
                      currentSong = chooseList(widget.num)[i]['song'];
                      currentImg = chooseList(widget.num)[i]['imageUrl'];
                    });
                  },
                ),
              ),
            ),
            !isFirst
                ? Container(
                    child: Column(
                      children: [
                        Slider.adaptive(
                          value: position.inSeconds.toDouble(),
                          min: 0.0,
                          max: duration.inSeconds.toDouble(),
                          onChanged: (value) {},
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OctoImage.fromSet(
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                currentImg,
                              ),
                              octoSet: OctoSet.circularIndicatorAndIcon(),
                            ),
                            Text(
                              currentTitle,
                            ),
                            IconButton(
                              icon: Icon(iconButton),
                              onPressed: () {
                                if (isPlaying) {
                                  audioPlayer.pause();
                                  setState(() {
                                    iconButton = Icons.play_arrow;
                                    isPlaying = false;
                                  });
                                } else {
                                  audioPlayer.resume();
                                  setState(() {
                                    iconButton = Icons.pause;
                                    isPlaying = true;
                                  });
                                }
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  )
                : SizedBox()
          ],
        ));
  }
}
