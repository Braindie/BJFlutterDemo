import 'package:flutter/material.dart';
import 'BJMainList.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new MyStatefulWidget(),
    );
  }
}



class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];


  void _onItemTapped(int index) {
    print(index);
    print(_selectedIndex);
    // 当我需要更新 State 的视图时，需要手动调用这个函数，它会触发 build() 。
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          '首页'
        ),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            _widgetOptions.elementAt(_selectedIndex),
            FlatButton(
              child: Text("Button"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push( context,
                 new MaterialPageRoute(builder: (context) {
                   return new NewRoute();
                 })
                );
              },
            )
          ],
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School')
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}


