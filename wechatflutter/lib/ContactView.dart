import "package:flutter/material.dart";
class ContactView extends StatefulWidget{
  @override
  _ContactViewState createState() => new _ContactViewState();
}
class _ContactViewState extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new ListView(
         children: <Widget>[
           new Container(
             color: Colors.grey[200],
             padding: EdgeInsets.all(10),
             alignment: Alignment.center,
             child: new Container(
               child: new ListTile(
                 title: new Text("搜索"),
                 leading: new Icon(Icons.search),

               ),
               color: Colors.white,
               height: 60,
             ),

           ),
           new Container(
               color:Colors.grey[200],
               //padding: EdgeInsets.only(top: 5),
               child: new Container(
                 child: new ListTile(
                   title: new Text("新朋友"),
                   leading: new Icon(Icons.add),
                 ),
                 color: Colors.white,
                 height: 50.0,
               ),
            ),
               
           new Container(
             child: new ListTile(
               title: new Text("群聊"),
               leading: new Icon(Icons.group),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("标签"),
               leading: new Icon(Icons.label),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("公众号"),
               leading: new Icon(Icons.person),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             color: Colors.grey[200],
             padding: const EdgeInsets.only(top: 20.0),
             child: new Container(
               child: new ListTile(
                 title: new Text("阿panda"),
                 leading: new Image.asset("images/xk.jpg",width: 35.0,height: 35.0,),
               ),
               height: 50.0,
               color: Colors.white,
             ),
           ),
           new Container(
             child: new ListTile(
               title: new Text("malvin"),
               leading: new Image.asset("images/a001.jpg",width: 35,height: 35,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("张三的歌"),
               leading: new Image.asset("images/a001.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("班主任"),
               leading: new Image.asset("images/a002.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("LebronJames"),
               leading: new Image.asset("images/lebron.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("石甲州"),
               leading: new Image.asset("images/a004.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("李思思"),
               leading: new Image.asset("images/a005.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("迪丽热巴"),
               leading: new Image.asset("images/img.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("古力娜扎"),
               leading: new Image.asset("images/a003.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("张三的歌"),
               leading: new Image.asset("images/a001.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("班主任"),
               leading: new Image.asset("images/a002.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("LebronJames"),
               leading: new Image.asset("images/lebron.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("石甲州"),
               leading: new Image.asset("images/a004.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("李思思"),
               leading: new Image.asset("images/a005.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("迪丽热巴"),
               leading: new Image.asset("images/img.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("古力娜扎"),
               leading: new Image.asset("images/a003.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("张三的歌"),
               leading: new Image.asset("images/a001.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("班主任"),
               leading: new Image.asset("images/a002.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("LebronJames"),
               leading: new Image.asset("images/lebron.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("石甲州"),
               leading: new Image.asset("images/a004.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("李思思"),
               leading: new Image.asset("images/a005.jpg",width: 35.0,height: 35.0,),
             ),

             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("迪丽热巴"),
               leading: new Image.asset("images/img.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
           new Container(
             child: new ListTile(
               title: new Text("古力娜扎"),
               leading: new Image.asset("images/a003.jpg",width: 35.0,height: 35.0,),
             ),
             height: 50.0,
             color: Colors.white,
           ),
         ],
        )
    );
  }
}