import 'package:flutter/material.dart';
class MagazineDetailView extends StatefulWidget {

  final dynamic item;

  const MagazineDetailView({@required this.item}) : super();


  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return _MagazineDetailStateView();
  }
}

class _MagazineDetailStateView extends State<MagazineDetailView>{



  Widget build(BuildContext context){

    return new Scaffold(

      appBar: new AppBar(title: new Text("杂志列表"),),
      body: new Text("杂志内容"),
    );


  }


}