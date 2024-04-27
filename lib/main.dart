import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:queuec/tellering.dart';

import 'forms.dart';
import 'home.dart';
import 'parking.dart';
import 'about.dart';
import 'registrar.dart';
import 'accounting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App!!',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: AnimatedSplashScreen(
          splash: 'images/logo.png',
          splashIconSize: 250,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: const Color(0XFFFFC20F),
          nextScreen: const MyHomePage(title: 'QueueC')),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 2;
  final navigationKey = GlobalKey<CurvedNavigationBarState>();

//names of screens;
  final screens = [
    TelleringPage(),
    RegistrarPage(),
    HomePage(),
    ParkingPage(),
    AccountingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.credit_card,
        size: 30,
      ),
      const Icon(
        Icons.fax_outlined,
        size: 30,
      ),
      const Icon(
        Icons.home,
        size: 30,
      ),
      const Icon(
        Icons.car_crash_outlined,
        size: 30,
      ),
      const Icon(Icons.bar_chart_outlined, size: 30),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: screens[index],
      backgroundColor: Colors.white,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Color(0XFFFFC20F)),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          backgroundColor: Colors.black,
          buttonBackgroundColor: Colors.white,
          color: Colors.black,
          index: index,
          items: items,
          onTap: (index) => setState(() => this.index = index),
        ),
      ),
    );
  }
}
