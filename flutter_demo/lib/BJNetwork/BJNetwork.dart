// import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'BJNetworkDetail.dart';

class BJNetwork extends StatefulWidget {
  @override
  BJNetworkState createState() => BJNetworkState();
}

class BJNetworkState extends State<BJNetwork> {
  var _words = [];
  String _text = "";

  void _requestData() async {
    var url =
        'https://v.juhe.cn/toutiao/index?key=c76f60c92d392d0a59d7cac0cae97a44';
    var httpClient = new HttpClient();

    httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      // Optionally set up headers...
      // Optionally write to the request object...
      // Then call close.

      return request.close();
    }).then((HttpClientResponse response) async {
      // Process the response.
      print('result');
      print(response);
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        var myData = data['result']['data'];
        setState(() {
          _words = myData;
        });
        print(myData);
      } else {
        _text = 'Error getting IP address:\nHttp status ${response.statusCode}';
        print(_text);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    print('开始网络请求');
    _requestData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
      ),
      body: new ListView.builder(
        padding: new EdgeInsets.fromLTRB(10, 20, 10, 20),
        itemExtent: 60.0,
        itemCount: _words.length,
        itemBuilder: (BuildContext context, int index) {
          var objc = _words[index];
          var title = objc['title'];
          return new GestureDetector(
            onTap: () {
              print('点击了item');
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => new BJNetworkDetail()),
              );
            },
            child: new Container(
              child: new Text(title),
            ),
          );
        },
      ),
    );
  }
}
