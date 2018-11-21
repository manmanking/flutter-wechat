import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:wechatflutter/Logic/menu_bloc.dart';


/*
*
* 仿照 项目 Flutter-UI-KIT
* */

class CollectionHomeView extends StatelessWidget{

  final _scaffoldState = GlobalKey<ScaffoldState>();
  Size deviceSize;
  BuildContext _context;


  Widget Home_iOS(BuildContext context) =>Theme(
      data: ThemeData(
        fontFamily: '.SF Pro Text',
      ).copyWith(canvasColor: Colors.transparent),
      child: CupertinoPageScaffold(
          child:CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                border: Border(bottom: BorderSide.none),
                backgroundColor: CupertinoColors.white,
              ),
            ],
          ),
      ),
  );

  Widget HomeScaffod(BuildContext context) =>Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Scaffold(key: _scaffoldState,body: body,)
  );



  Widget bodySliverList(){
    MenuBloc  menuBloc = MenuBloc();
  }

  Widget build(BuildContext context){

    _context = context;
    deviceSize = MediaQuery.of(context.size);
    return defaultTargetPlatform == TargetPlatform.iOS
        ? Home_iOS(context) : HomeScaffod(context);




  }

}

