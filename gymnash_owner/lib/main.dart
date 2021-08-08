import 'package:flutter/material.dart';
import 'package:gymnash_owner/Dashboard/Screens/DashboardScreen.dart';
import 'package:gymnash_owner/Dashboard/Screens/GymDetailsScreen.dart';
import 'package:gymnash_owner/Dashboard/Screens/RecordsScreen.dart';
import 'Auth/Screens/LoginScreen.dart';
import 'Dashboard/Screens/SubscriptionScreen.dart';
import 'Utilities/SharedPrefs.dart';
import 'Utilities/SizeConfig.dart';
import 'Utilities/Theme.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return MaterialApp(
        routes: {
          SplashScreen.routeName: (context) => SplashScreen(),
          DashboardScreen.routeName: (ctx) => DashboardScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          GymDetailScreen.routeName: (ctx) => GymDetailScreen(),
          RecordScreen.routeName: (ctx) => RecordScreen(),
          SubscriptionScreen.routeName: (ctx) => SubscriptionScreen(),
        },
        debugShowCheckedModeBanner: true,
        title: 'Gymnash',
        theme: ThemeData(
          accentColor: ThemeColors.accent,
          primarySwatch: ThemeColors.accentSwatch,
          fontFamily: ThemeFonts.muli,
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(backgroundColor: ThemeColors.secondary, brightness: Brightness.dark),
        ),
        navigatorObservers: [routeObserver],
      );
    });
  }
}

class SplashScreen extends StatefulWidget {
  static const routeName = "/";
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Future<bool> netAccess;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage message) async {
      // print('A new getInitialMessage event was published!');
      // if (message != null && message.data != null) {
      //   print("Kyra : " + message.data.toString());
      //   Navigator.popAndPushNamed(context, message.data['routeName'].toString());
      // } else {
      //   final DeviceInfoPlugin deviceInfoPlugin = new DeviceInfoPlugin();
      //   final fcmToken = await FirebaseMessaging.instance.getToken();
      //   Map<String, String> deviceInfo;
      //   try {
      //     if (Platform.isAndroid) {
      //       final build = await deviceInfoPlugin.androidInfo;
      //       deviceInfo = {
      //         "platformUniqueId": build.androidId,
      //         "platform": "Android",
      //         "platformVersion": "${build.version.release}(SDK ${build.version.sdkInt})",
      //         "deviceName": build.model,
      //         "deviceBrand": build.brand,
      //         "deviceManufacturer": build.manufacturer,
      //         "isPhysicalDevice": build.isPhysicalDevice.toString(),
      //         "fcmToken": fcmToken
      //       };
      //     } else if (Platform.isIOS) {
      //       final build = await deviceInfoPlugin.iosInfo;
      //       deviceInfo = {
      //         "platformUniqueId": build.identifierForVendor,
      //         "platform": "iOS",
      //         "platformVersion": build.systemVersion,
      //         "deviceName": build.model,
      //         "deviceBrand": build.name,
      //         "deviceManufacturer": "Apple",
      //         "isPhysicalDevice": build.isPhysicalDevice.toString(),
      //         "fcmToken": fcmToken
      //       };
      //     }
      //   } on PlatformException {
      //     print('Failed to get platform version');
      //   }
      //   if (deviceInfo != null) await APIClient().addDevice(deviceInfo);

      List<bool> initVals = await SharedPrefs().initialize();
      String routeName = initVals[0] ? DashboardScreen.routeName : LoginScreen.routeName;
      Navigator.popAndPushNamed(context, routeName);
      // }
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(builder: (context) {
        final size = MediaQuery.of(context).size;
        SizeConfig().init(size.height, size.width);
        return Center(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [Image.asset("assets/loginbg.png", width: SizeConfig.widthMultiplier * 52), CircularProgressIndicator()],
            ),
          ),
        );
      }),
    );
  }
}
