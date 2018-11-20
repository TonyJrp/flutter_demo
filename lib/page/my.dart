import 'package:flutter/material.dart';
 
class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
 
    return new Page();
  }
}

class Page extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }
 
  Widget layout(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          header(context),
        ],
      ),
    );
  }
 
  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('个人中心'));
  }
  Widget header(BuildContext context) {
    return new Image.network(
      'https://img.wochu.cn/applitImg/recharge.png',
    );
  }
  }
