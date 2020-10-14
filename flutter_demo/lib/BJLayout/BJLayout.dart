import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class BJLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BJLayoutState();
  }
}

class BJLayoutState extends State<BJLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Scaffold是一个路由页的骨架
        appBar: AppBar(
          title: Text('Layout'),
        ),
        body: new ListView(children: <Widget>[
          HeaderImge(),
          HeaderText(),
          ButtonSection(),
          FooterSection()
        ]));
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
        ));
  }
}

// 头部文本
class HeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // 组合类容器
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
                  style: new TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ],
            ),
          ),
          FavoriteWidget()
        ],
      ),
    );
  }
}

// 可点的星星
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => new _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 20;

  void _touchFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited
                ? new Icon(Icons.star)
                : new Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _touchFavorite,
          ),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(
            child: new Text('$_favoriteCount'), // 占位符
          ),
        )
      ],
    );
  }
}

// 按钮
class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    // 自定义按钮
    Column buildButtonColumn(IconData icon, String label) {
      return new Column(
        mainAxisSize: MainAxisSize.min, // 聚集在一起
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(icon, color: Colors.blue),
          new Container(
            margin: const EdgeInsets.only(top: 8.0),
            child: new Text(label, style: new TextStyle(fontSize: 12.0)),
          )
        ],
      );
    }

    return Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.call, 'CALL'),
          buildButtonColumn(Icons.near_me, 'ROUTE'),
          buildButtonColumn(Icons.share, 'SHARE')
        ],
      ),
    );
  }
}

// 文本
class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext content) {
    return new Container(
      padding: const EdgeInsets.all(20),
      child: new Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
  }
}
