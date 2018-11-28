import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:async';


class SleepPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new _SleepPageState();
}
class _SleepPageState extends State<SleepPage> {
  var _ipAddress = 'Unknown';
  var _text = '';
  _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(json);
        result = data['origin'];
      } else {
        result =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      _ipAddress = result;
    });
  }
  _getNetData() async {
    var responseBody;
    var url = 'http://gank.io/api/data/Android/10/1';
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        responseBody = JSON.decode(json);
        print(responseBody);
      } else {
        result =[];
      }
    } catch (exception) {
      result = [];
    }
    await responseBody['results'].map((Map item){
       newTitle.add(item);
     }).toList();    
  }



  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);
    _getNetData();
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('Your current IP address is:'),
            new Text('$_ipAddress.'),
            spacer,
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('Get IP address'),
            ),
            new Text('$_text.')
          ],
        ),
      ),
    );
  }
}
