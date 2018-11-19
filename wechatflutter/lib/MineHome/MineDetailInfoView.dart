import 'package:flutter/material.dart';

class MineDetailInfoView extends StatefulWidget{
  @override
  _MineDetailInfoViewState createState() => new _MineDetailInfoViewState();
}
class _MineDetailInfoViewState extends State<MineDetailInfoView> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("我的信息"),),
      body: new Text("Mine Info Detail"),
    );
  }
}