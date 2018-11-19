import 'package:flutter/material.dart';
import 'MineHome/MineDetailInfoView.dart';
import 'MineHome/MineWalletView.dart';
import 'MineHome/MineNETView.dart';
import 'MineHome/MagazineHomeView.dart';
class MineView extends StatefulWidget{
  @override
  _MineViewState createState() => new _MineViewState();
}
class _MineViewState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new ListView(
         children: <Widget>[
           new Container(
             padding: const EdgeInsets.only(top: 20),
             color: Colors.grey[200],
             child: new Container(
               height: 80,
               color: Colors.white,
               child: new ListTile(
                 leading: new Image.asset("images/a001.jpg"),
                 title: new Text("Cade"),
                 subtitle: new Text("微信号:Cade001"),
                 trailing: new Icon(Icons.fullscreen),
                 onTap: (){
                   Navigator.of(context).push(
                     new MaterialPageRoute(
                         builder: (context){
                           return  new MineDetailInfoView();
                         }
                     ),
                   );
                 },
               ),
             )

           ),
           new Container(
             color: Colors.grey[200],
             padding:const EdgeInsets.only(top: 20) ,
             child: new Container(
               height: 50,
               color: Colors.white,
               child: new ListTile(
                 leading: new Icon(Icons.call_to_action),
                 title: new Text("钱包"),
                 onTap: (){
                   Navigator.of(context).push(
                     MaterialPageRoute(
                         builder: (context){
                           return  MineWalletView();
                         }),
                   );
                 },
               ),
             ),
           ),
           new Container(
             padding: EdgeInsets.only(top: 20),
             color: Colors.grey[200],
             child: new Container(
               height: 50,
               color: Colors.white,
               child: new ListTile(
                 leading: new Icon(Icons.dashboard),
                 title: new Text("收藏"),
               ),
             ),
           ),
           new Container(
             color: Colors.white,
             height: 50,
             child: new ListTile(
               leading: new Icon(Icons.photo),
               title: new Text("相册"),
             ),
           ),
           new Container(
             color: Colors.white,
             height: 50,
             child: new ListTile(
               leading:  new Icon(Icons.credit_card),
               title: new Text("卡包"),
             ),
           ),
           new Container(
             color: Colors.white,
             height: 50,
             child: new ListTile(
               leading: new Icon(Icons.tag_faces),
               title: new Text("表情"),
             ),
           ),
           new Container(
             padding: EdgeInsets.only(top: 20),
             color: Colors.grey[200],
             child: new Container (
               height: 50,
                color: Colors.white,
                child: new ListTile(
                leading: new Icon(Icons.settings),
                title: new Text("设置"),
                 ),
             ),
           ),
           new Container(
             padding: EdgeInsets.only(top: 20),
             color: Colors.grey[200],
             child: new Container(
               height: 50,
               color: Colors.white,
               child: new ListTile(
                 title: new Text("网络"),
                 subtitle: new Text("网络列表"),
                 leading: new Icon(Icons.network_cell),
                 onTap: (){
                   Navigator.of(context).push(
                     MaterialPageRoute(
                         builder: (context){
                           return  MineNETView();
                         }),
                   );
                 },
               ),
             ),
           ),
           new Container(
             color: Colors.white,
             child: new ListTile(
               title: new Text("杂志"),
               subtitle: new Text("杂志列表"),
               leading: new Icon(Icons.open_in_new),
               onTap: (){
                 Navigator.of(context).push(
                   MaterialPageRoute(builder:(context){
                    return MagazineHomeView();
                    }),
                 );
               },
             ),
           )
         ],

        ),
    );
  }
}