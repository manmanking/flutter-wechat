import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Widget_CommonView.dart';
import 'MagazineDetailView.dart';
import 'dart:io';



class MagazineHomeView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MagazineHomeViewState();
  }
}

class _MagazineHomeViewState extends State<MagazineHomeView>{

  dynamic _data_response;
  List<Widget> widget_list = <Widget>[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context){

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: _data_response == null ?
        Center(child: CircularProgressIndicator(),)
            :ListView.builder(
                itemBuilder:(c,i)=> widget_list[i],
                itemCount: widget_list.length,
            ),

        );

//    return new Scaffold(
//      appBar: new AppBar(title: new Text("杂志列表"),),
//      body: new ListView(
//        children: <Widget>[
//          new Container(
//            color: Colors.white,
//            child: new ListTile(
//              title: new Text("杂志1"),
//
//            ),
//          )
//        ],
//      )
//    );
  }

  Widget buildPageView(List<Widget> list){

    print(list.length);

    return Container(
      height: 276.0,
      width: double.infinity,
      child: PageView.builder(
          itemBuilder:(c,i){
            return list[i];
          },
        itemCount: 5,
        controller: PageController(viewportFraction: 0.85),
        physics: AlwaysScrollableScrollPhysics(),
      ),
    );

  }







  _loadData()async {

    String dataUrl = "http://www.wanandroid.com/tools/mockapi/8977/kanyan";
    http.Response response = await http.get(dataUrl);
    final data = json.decode(response.body);
    _data_response = data;
    _buildList();

//    String dataURL = "https://api.github.com/orgs/raywenderlich/members";
//    http.Response response = await http.get(dataURL);
//    setState(() {
//
//      final membersJSON = json.decode(response.body);
//      for (var memberJSON in membersJSON){
//        final member = new Member(memberJSON["login"],memberJSON["avatar_url"]);
//        _members.add(member);
//
//      }
//    });

  }


  void _buildList() {
    final list = <Widget>[];
    _data_response.data['itemList'].sublist(0, 5).forEach((it) {
      final item = it['data'];
      list.add(Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Column(
        children:<Widget>[
          ImageItem(
            imgUrl: item['cover']['feed'],
          ),
          AvatarItem(
            imgUrl: item['author']['icon'],
            text1: item['author']['name'],
            text2: item['author']['description'],
          ),
        ]

      ),
      )
      );
    });

    widget_list.add(Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Text("FRIDAY,JULY 13",
        style: TextStyle(
            color: Colors.grey[200],
            fontFamily: 'Lobster',
            fontSize: 16.0
        ),
      ),
    ));
    widget_list.add(TitleItem(
      text: "开眼今日编辑精选",
      //text: new Text("开眼今日编辑精选"),
    ));


    final data = _data_response.data['itemList'];
    for (var i = 0; i < data.length - 1; i++) {
      var item = data[i]['data'];
      switch (i % 3) {
        case 0:
          widget_list.add(TitleItem(
            text: '近期热门',
            followGone: true,
          ));
          widget_list.add(ImageItem(
            imgUrl: item['cover']['feed'],
          ));
          widget_list.add(AvatarItem(
            text1: item['title'],
            text2: '#' + item['category'],
          ));
          break;
        case 1:
          widget_list.add(GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (c) =>
                      MagazineDetailView(
                        item: item,
                      )));
            },
            child: PicTextItem(
              imgUrl: item['cover']['feed'],
              text1: item['title'],
              text2: '#' + item['category'],
            ),
          ));
          break;
        case 2:
          widget_list.add(PicTextItem(
            imgUrl: item['cover']['feed'],
            text1: item['title'],
            text2: '#' + item['category'],
          ));
          break;
      }

    }
    setState(() {});
  }





}