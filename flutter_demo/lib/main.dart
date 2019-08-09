import 'package:flutter/material.dart';
import 'BJLayout/BJLayout.dart';
import 'BJAnimation/BJAnimation.dart';
import 'BJNetwork/BJNetwork.dart';
import 'BJFrame/BJFrame.dart';
import 'BJFunction/BJFunction.dart';

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
  List<Widget> pages = List<Widget>();

  @override
    void initState() {
      super.initState();
      pages ..add(BJLayout()) 
            ..add(BJAnimation())
            ..add(BJNetwork())
            ..add(BJFrame())
            ..add(BJFunction());
    }

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
    return Scaffold( //Scaffold是一个路由页的骨架
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud,
            ),
            title: Text(
              '布局',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud,
            ),
            title: Text(
              '动画',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud,
            ),
            title: Text(
              '网络',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud,
            ),
            title: Text(
              '架构',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud,
            ),
            title: Text(
              '功能',
            ),
          )
        ],
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        selectedIconTheme: IconThemeData(color: Colors.blue),
        unselectedIconTheme: IconThemeData(color: Colors.grey),
        onTap: _onItemTapped,
      ),
    );
  }
}


