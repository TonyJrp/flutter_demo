import 'package:flutter/material.dart';
 
class ClassifyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
 
    return new Page();
  }
}
 
class Page extends State<ClassifyPage> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }
 
  Widget layout(BuildContext context) {
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          header(context),
          header(context),
          header(context),
          header(context),
          header(context),
        ],
      ),
    );
  }
 
  Widget header(BuildContext context) {
    return new Image.network(
      'https://img.wochu.cn/newretail/d005e796f3d142d2355f64f0be83a658.jpg',
    );
  }
  }