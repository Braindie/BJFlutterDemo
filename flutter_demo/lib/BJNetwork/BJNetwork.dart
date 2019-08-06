import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';


class BJNetwork extends StatefulWidget {

  @override
  BJNetworkState createState() => BJNetworkState();
}

class BJNetworkState extends State<BJNetwork> {
  var _words = [];
  String _text = "";

  void _requestData() async {
    
    var url = 'http://v.juhe.cn/toutiao/index?key=c76f60c92d392d0a59d7cac0cae97a44';
    var httpClient = new HttpClient();

    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        var myData = data['result']['data'];  
        setState(() {
          _words = myData;
        });
        print(myData);
      } else {
        _text =
            'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      _text = 'Failed getting IP address';
    }
  }

  @override
    void initState() {
      super.initState();
      _requestData();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网络"),
      ),
      body: new ListView.builder(
        padding: new EdgeInsets.all(15.0),
        itemExtent: 60.0,
        itemCount: _words.length,
        itemBuilder: (BuildContext context,int index){
          var objc = _words[index];
          var title = objc['title'];
          return new Text(title);
        },
      ),
    );
  }
}