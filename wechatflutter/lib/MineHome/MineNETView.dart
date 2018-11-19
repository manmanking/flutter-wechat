import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; //网络请求API
import 'dart:convert';
import 'Member.dart';


//import 'package:quiver/strings.dart';
import 'dart:io'; //网络请求库 dio 为第三方库 dart.io  封装dart.io

//import 'package:';
class MineNETView extends StatefulWidget{

  @override
  _MineNETViewState createState() => new _MineNETViewState();


}

class _MineNETViewState extends State<MineNETView>{

  var _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadData();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("网络请求"),),
      body: new ListView.builder(
        //padding: const EdgeInsets.all(16.0),
        itemCount: _members.length,
        itemBuilder: (BuildContext context,int position){

          if (position.isOdd) return _buildDivider(position);
          final index = position ~/ 2;
          return _buildRow(index);//_buildRowAndLine(position);//_buildRow(index);
        }
      ),//new Text("网络请求列表"),
    );
  }



  Widget _buildRowAndLine(int i){

    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new Container(
            child: new ListTile(
              title: new Text("${_members[i].login }",style: _biggerFont,),
              leading: new CircleAvatar(
                backgroundColor: Colors.green,
                backgroundImage: new NetworkImage(_members[i].avatar_url),
              ),
            ),
          ),
          new Container(
            child: new Divider(
              color: i ~/ 2 == 0 ? Colors.green: Colors.red,
            ),
          )
        ],
      ),
    );


  }

  _loadData() async {

    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
    http.Response response = await http.get(dataURL);
    setState(() {

      final membersJSON = json.decode(response.body);
      for (var memberJSON in membersJSON){
        final member = new Member(memberJSON["login"],memberJSON["avatar_url"]);
        _members.add(member);

      }
    });
  }

  Widget _buildRow(int i) {
    return new ListTile(
      title: new Text("${_members[i].login}", style: _biggerFont),
      leading: new CircleAvatar(
        backgroundColor: Colors.green,
        backgroundImage: new NetworkImage(_members[i].avatar_url),
      ),
    );
  }
  Widget _buildDivider(int i){

    return new Divider(
      color:  Colors.red,


    );


  }
}