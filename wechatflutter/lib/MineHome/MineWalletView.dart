import 'package:flutter/material.dart';

class MineWalletView extends StatefulWidget{
  _MineWalletViewState createState() => new _MineWalletViewState();

}

class _MineWalletViewState extends State<MineWalletView>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.red,
      body: new Text("钱包信息"),
    );
  }


}


//@override
//_MineDetailInfoViewState createState() => new _MineDetailInfoViewState();
//}
//class _MineDetailInfoViewState extends State<MineDetailInfoView> {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(title: new Text("我的信息"),),
//      body: new Text("Mine Info Detail"),
//    );
//  }
//}