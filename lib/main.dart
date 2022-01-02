import 'package:flutter/material.dart';
import 'package:gameshot/pages/homepage/homepage.dart';
import 'package:gameshot/pages/onBoarding/onBoarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xffFF0000),
          secondary: const Color(0xff181818),
        ),
        primarySwatch: Colors.blue,
      ),
      initialRoute: Homepage.routeName,
      routes: {
        onBoardingPage.routeName : (context)=> onBoardingPage(),
        Homepage.routeName:(context)=>Homepage(),
      },
    );
  }
}
