import 'package:flutter/material.dart';
import 'package:flutter_demo/page/cart.dart';
import 'package:flutter_demo/page/classify.dart';
import 'package:flutter_demo/page/home.dart';
import 'package:flutter_demo/page/my.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() => new MainPageState();
}

class MainPageState extends State<MyApp> {
  int _tabIndex = 0;
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));

  var tabImages;
  var _pageList;
  var appBarTitles = ['首页', '点单', '购物车', '我的'];

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/home.png'),
          getTabImage('images/home_selected.png')
        ],
        [
          getTabImage('images/classify.png'),
          getTabImage('images/classify_selected.png')
        ],
        [
          getTabImage('images/cart.png'),
          getTabImage('images/cart_selected.png')
        ],
        [
          getTabImage('images/my.png'), 
          getTabImage('images/my_selected.png')
        ]
      ];
    }

    _pageList = new IndexedStack(
      children: <Widget>[
        new HomePage(),
        new ClassifyPage(),
        new CartPage(),
        new MyPage(),
      ],
      index: _tabIndex,
    );
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new MaterialApp(
        theme: new ThemeData(primaryColor: const Color(0xFF63CA6C)),
        home: new Scaffold(
          appBar: new AppBar(
              title: new Text(appBarTitles[_tabIndex],
              style: new TextStyle(color: Colors.white)),
              iconTheme: new IconThemeData(color: Colors.white)),
          body: _pageList,
          bottomNavigationBar: new BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  icon: getTabIcon(0), title: getTabTitle(0)),
              new BottomNavigationBarItem(
                  icon: getTabIcon(1), title: getTabTitle(1)),
              new BottomNavigationBarItem(
                  icon: getTabIcon(2), title: getTabTitle(2)),
              new BottomNavigationBarItem(
                  icon: getTabIcon(3), title: getTabTitle(3)),
            ],
            type: BottomNavigationBarType.fixed,
            //默认选中首页
            currentIndex: _tabIndex,
            //点击事件
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
          ),
        ));
  }
}


