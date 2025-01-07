import 'package:flutter/material.dart';

import 'views/home/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healtether Flutter Task',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
