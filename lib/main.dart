import 'package:flutter/material.dart';

import 'package:waterproject_v3/ui/home_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'WaterProject',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new HomeUI(),
    );
  }
}
