import 'package:flutter/material.dart';
class MusicPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _MusicPageState();
}
class _MusicPageState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('我的'),
        )
      ),
    );
  }

}
