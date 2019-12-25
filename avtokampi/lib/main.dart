import 'dart:io';

import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:splashscreen/splashscreen.dart';

import 'layouts/login_register.dart';

void main() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
    ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness:
            Platform.isAndroid ? Brightness.dark : Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarDividerColor: Colors.grey,
            systemNavigationBarIconBrightness: Brightness.dark,
        ));
        return MaterialApp(
            title: 'Aplikacija za kampiranje',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                textTheme: AppTheme.textTheme,
                platform: TargetPlatform.android,
            ),
            home: new SplashScreen(
                seconds: 5,
                navigateAfterSeconds: new LoginScreen(),
                title: new Text(
                    'APLIKACIJA\nZA KAMPIRANJE', style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.yellow,
                    fontSize: 45.0,
                    fontFamily: "BalooBhai",
                ), textAlign: TextAlign.center,),
                image: new Image.asset('assets/images/ikona.png'),
                backgroundColor: Colors.black,
                loadingText: new Text("Ne čakaj na maj, kampiraj zdaj!", style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.yellow,
                    fontFamily: "Pacifico",),),
                photoSize: 100.0,
                loaderColor: Colors.white
            ));
    }
}

class HexColor extends Color {
    HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

    static int _getColorFromHex(String hexColor) {
        hexColor = hexColor.toUpperCase().replaceAll('#', '');
        if (hexColor.length == 6) {
            hexColor = 'FF' + hexColor;
        }
        return int.parse(hexColor, radix: 16);
    }
}
