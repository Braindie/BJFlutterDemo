import 'package:flutter/material.dart';

class BJLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BJLayoutState();
  }
}

class BJLayoutState extends State<BJLayout> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold( // Scaffold是一个路由页的骨架
      appBar: AppBar(
        title: Text('布局'),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HeaderImge(),
          HeaderText()
        ]
      )
    );
  }
}

// 头部图片
class HeaderImge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      child: Image(
        image: AssetImage('lib/images/mess.jpg'),
      )
    );
  }
}

// 头部文本
class HeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( // 组合类容器
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: [
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    '我是大标题',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new Text(
                  '我是副标题',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text('41'),
        ],
      ),
    );
  }
}
