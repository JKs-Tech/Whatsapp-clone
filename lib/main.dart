import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp/colors.dart';
import 'package:whatsapp/firebase_options.dart';
import 'package:whatsapp/futures/landing/screens/landing_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:whatsapp/route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whatsapp',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: AppBarTheme(color: appBarColor)),
        onGenerateRoute: ((settings) => generateRoute(settings)),
        home: LandingScreen());
  }
}
