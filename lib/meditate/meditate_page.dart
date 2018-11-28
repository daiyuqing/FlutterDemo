import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';


class MeditatePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _MeditatePageState();
}
class _MeditatePageState extends State<MeditatePage> {
  loadData() async {
    String loadRUL = "https://api.douban.com/v2/movie/in_theaters";
    http.Response response = await http.get(loadRUL);
    var result = json.decode(response.body);
    setState(() {
      title = result['title'];
      print('title: $title');
      subjects = result['subjects'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('通知'),
        )
      ),
    );
  }

}
