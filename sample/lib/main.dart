import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info/package_info.dart';
import 'package:sample/playlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Colors.teal),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel("com.example.sample/detectFaces");
  String _batteryLevel = 'n';
  String emotion1 = "";
  String emotion2 = "";

  Future<void> _getImageDetected(String path) async {
    String batteryLevel = "Hello";
    try {
      final result = await platform.invokeMethod('detectFaces', {"uri": path});
      print("Kyra " + result.toString());
      if (result != "404") {
        batteryLevel = result['Face 1'].toString();
        emotion1 = result['Face 1'][0];
        emotion2 = result['Face 1'][1];
      }
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
      isLoading = false;
    });
  }

  bool isLoading = false;
  void getPlayList(str) {
    if (str[0] == 'h') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlayistScreen(0),
        ),
      );
    } else if (str[0] == 's' && str[1] == 'a') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlayistScreen(1),
        ),
      );
    } else if (str[0] == 'n') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlayistScreen(2),
        ),
      );
    } else if (str[0] == 's' && str[1] == 'u') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlayistScreen(3),
        ),
      );
    } else if (str[0] == 'a') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlayistScreen(4),
        ),
      );
    }
  }

  Widget customButton(String emotion1, String emotion2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ignore: deprecated_member_use
        RaisedButton(
          color: Colors.teal[500],
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () {
            getPlayList(emotion1);
          },
          child: Text(
            emotion1,
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        // ignore: deprecated_member_use
        RaisedButton(
          color: Colors.teal[500],
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          onPressed: () {
            getPlayList(emotion2);
          },
          child: Text(
            emotion2,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Emotion Music Player"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RaisedButton(
              elevation: 0,
              color: Colors.teal,
              shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Get Image",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              onPressed: () async {
                final picker = ImagePicker();
                final image = await picker.getImage(source: ImageSource.camera);
                setState(() {
                  isLoading = true;
                });
                PackageInfo packageInfo = await PackageInfo.fromPlatform();
                _getImageDetected(image.path.substring(image.path.indexOf(packageInfo.packageName) + packageInfo.packageName.length));
              },
            ),
            isLoading == true
                ? CircularProgressIndicator()
                : _batteryLevel.length < 10
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "No face found",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Choose your Playlist",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          customButton(emotion1, emotion2),
                        ],
                      )
          ],
        ),
      ),
    );
  }
}
