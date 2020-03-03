import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:toggle_bar_button/toggle_bar_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ToggleBarButton(
            tabItems: ["Apples", 'Bananas', 'Oranges', 'Papayas'],
            tabContentItems: <Widget>[
              Center(child: Text('Apples')),
              Center(child: Text('Bananas')),
              Center(child: Text('Oranges')),
              Center(child: Text('Papayas')),
            ],
          ),
        ),
      ),
    );
  }
}
