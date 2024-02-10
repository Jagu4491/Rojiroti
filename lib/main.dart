import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

import 'histroy_page.dart';
import 'music_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rama\'s Temple App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HistoryScreen(),
      routes: {
        '/templeHistory': (context) => HistoryScreen(),
        '/musicLibrary': (context) => MusicScreen(),
      },
    );
  }
}