import 'package:flutter/material.dart';
class DiscoverView extends StatefulWidget{
  @override
  _DiscoverViewState createState() => new _DiscoverViewState();
}
class _DiscoverViewState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new ListView(
          children: <Widget>[
            new Container(
              padding: EdgeInsets.only(top: 20.0),
              color: Colors.grey[200],
              child: new Container(
                height: 50.0,
                child: new ListTile(
                  leading: new Icon(Icons.camera),
                  title: new Text("朋友圈"),
                ),
                color: Colors.white,
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 20.0),
              color: Colors.grey[200],
              child: new Container(
                height: 50.0,
                color: Colors.white,
                child: new ListTile(
                  leading: new Icon(Icons.scanner),
                  title: new Text("扫一扫"),
                  
                ),
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 20),
              color: Colors.grey[200],
              child: new Container(
                height: 50.0,
                color: Colors.white,
                child: new ListTile(
                  title: new Text("看一看"),
                  leading: new Icon(Icons.star),
                ),
              ),
            ),

            new Container(
              height: 50.0,
              color: Colors.white,
              child: new ListTile(
                leading: new Icon(Icons.search),
                title: new Text("搜一搜"),
              )
            ),
            new Container(
              padding: EdgeInsets.only(top: 20.0),
              color: Colors.grey[200],
              child: new Container(
                height: 50.0,
                color: Colors.white,
                child: new ListTile(
                  leading: new Icon(Icons.people),
                  title: new Text("附近的人"),
                ),
              ),
            ),
            new Container(
              height: 50.0,
              color: Colors.white,
              child: new ListTile(
                leading: new Icon(Icons.hourglass_empty),
                title: new Text("漂流瓶"),
              ),
            ),
            new Container(
              padding: EdgeInsets.only(top: 20.0),
              color: Colors.grey[200],
              child: new Container(
                height: 50.0,
                color: Colors.white,
                child: new ListTile(
                  title: new Text("购物"),
                  leading: new Icon(Icons.shopping_cart),
                ),
              )
            ),
            new Container(
              color: Colors.white,
              height: 50.0,
              child: new ListTile(
                title: new Text("游戏"),
                leading: new Icon(Icons.games),
              ),
            ),
            new Container(
              color: Colors.grey[200],
              padding: EdgeInsets.only(top: 20.0),
              child: new Container(
                color: Colors.white,
                height: 50.0,
                child: new ListTile(
                  title: new Text("小程序"),
                  leading: new Icon(Icons.apps),
                ),
              ),
            )
          ],
        )
    );
  }
}