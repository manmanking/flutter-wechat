import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:wechatflutter/Util/UIData.dart';
import 'package:wechatflutter/Logic/menu_bloc.dart';
import 'package:wechatflutter/model/MenuModel.dart';


/*
*
* 仿照 项目 Flutter-UI-KIT
* */

class CollectionHomeView extends StatelessWidget{

  final _scaffoldState = GlobalKey<ScaffoldState>();
  Size deviceSize;
  BuildContext _context;
  void _showModalBottomSheet(BuildContext context, MenuModel menu) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Material(
            clipBehavior: Clip.antiAlias,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                    topLeft: new Radius.circular(15.0),
                    topRight: new Radius.circular(15.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //header(),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: false,
                    itemCount: menu.items.length,
                    itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListTile(
                          title: Text(
                            menu.items[i],
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(
                                context, "/${menu.items[i]}");
                          }),
                    ),
                  ),
                ),
                //MyAboutTile()
              ],
            )));
  }

  //menuStack
  Widget menuStack(BuildContext context, MenuModel menu) => InkWell(
    onTap: () => _showModalBottomSheet(context, menu),
    splashColor: Colors.orange,
    child: Card(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          menuImage(menu),
          menuColor(),
          menuData(menu),
        ],
      ),
    ),
  );

  //stack 1/3
  Widget menuImage(MenuModel menu) => Image.asset(
    menu.image,
    fit: BoxFit.cover,
  );

  //stack 2/3
  Widget menuColor() => new Container(
    decoration: BoxDecoration(boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black.withOpacity(0.8),
        blurRadius: 5.0,
      ),
    ]),
  );

  //stack 3/3
  Widget menuData(MenuModel menu) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(
        menu.icon,
        color: Colors.white,
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        menu.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )
    ],
  );


  Widget iosCardBottom(MenuModel menu, BuildContext context) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 40.0,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 3.0, color: Colors.white),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    menu.image,
                  ))),
        ),
        SizedBox(
          width: 20.0,
        ),
        Text(
          menu.title,
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 20.0,
        ),
        FittedBox(
          child: CupertinoButton(
            //暂时将点击事件屏蔽 ，后面在开启
            //onPressed: () => _showModalBottomSheet(context, menu),
            borderRadius: BorderRadius.circular(50.0),
            child: Text(
              "Go",
              textAlign: TextAlign.left,
              style: TextStyle(color: CupertinoColors.activeBlue),
            ),
            color: Colors.white,
          ),
        )
      ],
    ),
  );

  Widget menuIOS(MenuModel menu, BuildContext context) {
    return Container(
      height: deviceSize.height / 2,
      decoration: ShapeDecoration(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 3.0,
        margin: EdgeInsets.all(16.0),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            menuImage(menu),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                menu.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              height: 60.0,
              child: Container(
                width: double.infinity,
                color: menu.menuColor,
                child: iosCardBottom(menu, context),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget bodyDataIOS(List<MenuModel> data, BuildContext context) => SliverList(
    delegate: SliverChildListDelegate(
        data.map((menu) => menuIOS(menu, context)).toList()),
  );

//  Widget menuImage(MenuModel menu) => Image.asset(
//    menu.image,
//    fit: BoxFit.cover,
//  );

  Widget homeBodyIOS(BuildContext context) {
    MenuBloc menuBloc = MenuBloc();
    return StreamBuilder<List<MenuModel>>(
        stream: menuBloc.menuItems,
        initialData: List(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? bodyDataIOS(snapshot.data, context)
              : Center(
            child: CircularProgressIndicator(),
          );
        });
  }
  Widget Home_iOS(BuildContext context) =>Theme(
      data: ThemeData(
        fontFamily: '.SF Pro Text',
      ).copyWith(canvasColor: Colors.transparent),
      child: CupertinoPageScaffold(
          child:CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                border: Border(bottom: BorderSide.none),
                backgroundColor: CupertinoColors.activeGreen,
                largeTitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(UIData.appName),
                    Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: CupertinoColors.black,
                          child: FlutterLogo(
                            size: 15,
                            colors: Colors.yellow,
                          ),
                        ),
                    )
                  ],
                ),
              ),
              homeBodyIOS(context),
            ],
          ),
      ),
  );

  Widget homeScaffod(BuildContext context) =>Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: Scaffold(key: _scaffoldState,body: bodySliverList()),
  );

  //bodygrid
  Widget bodyGrid(List<MenuModel> menu) => SliverGrid(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount:
      MediaQuery.of(_context).orientation == Orientation.portrait
          ? 2
          : 3,
      mainAxisSpacing: 0.0,
      crossAxisSpacing: 0.0,
      childAspectRatio: 1.0,
    ),
    delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return menuStack(context, menu[index]);
    }, childCount: menu.length),
  );


//appbar
  Widget appBar() => SliverAppBar(
    backgroundColor: Colors.black,
    pinned: true,
    elevation: 10.0,
    forceElevated: true,
    expandedHeight: 150.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: false,
      background: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: UIData.kitGradients)),
      ),
      title: Row(
        children: <Widget>[
          FlutterLogo(
            colors: Colors.yellow,
            textColor: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(UIData.appName)
        ],
      ),
    ),
  );

  Widget bodySliverList(){
    MenuBloc  menuBloc = MenuBloc();
    return StreamBuilder<List<MenuModel>>(
        stream: menuBloc.menuItems,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? CustomScrollView(
            slivers: <Widget>[
              appBar(),
              bodyGrid(snapshot.data),
            ],
          )
              : Center(child: CircularProgressIndicator());
        });
  }

  Widget build(BuildContext context){

    _context = context;
    deviceSize = MediaQuery.of(context).size;
    return defaultTargetPlatform == TargetPlatform.iOS
        ? Home_iOS(context) : homeScaffod(context);




  }

}

