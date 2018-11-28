import 'package:flutter/material.dart';
class MorePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _MorePageState();
}
class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('more'),
        )
      ),
    );
  }

}
