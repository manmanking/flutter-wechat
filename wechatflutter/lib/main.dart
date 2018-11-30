import 'package:flutter/material.dart';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'dart:async';
import 'HomeView.dart';
import 'DiscoverView.dart';
import 'ContactView.dart';
import 'MineView.dart';


//List<CameraDescription> cameras;


void main() async {

//  try {
//    cameras = await availableCameras();
//  } on QRReaderException catch (e){
//    //Error(e.code,e.description);
//    print('Error: $(e.code)\nError Message: $(e.description)');
//  }

  //return MyApp();
    runApp(MyApp());

  //try {
  //    cameras = await availableCameras();
  //  } on QRReaderException catch (e) {
  //    logError(e.code, e.description);
  //  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: Center(
        child: new RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {


  @override
  createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{

  final List<BottomNavigationBarItem> listSet = [
    new BottomNavigationBarItem(icon: new Icon(Icons.chat,color: Colors.grey),title: new Text("微信")),
    new BottomNavigationBarItem(icon: new Icon(Icons.perm_contact_calendar,color: Colors.grey),title: new Text("通讯录")),
    new BottomNavigationBarItem(icon: new Icon(Icons.room,color: Colors.grey),title: new Text("发现")),
    new BottomNavigationBarItem(icon: new Icon(Icons.perm_identity,color: Colors.grey),title: new Text("我")),

  ];
  final List<StatefulWidget> viewControllerSet = [new HomeView(),new ContactView(),new DiscoverView(),new MineView()];

  int _selectedIndex = 0;

  @override
  Widget  build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("微信"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: null)
        ],
      ),
      bottomNavigationBar: new BottomNavigationBar(items: listSet,type: BottomNavigationBarType.fixed,onTap: (int index){
        setState(() {
          _selectedIndex = index;
        });
        print("selected index$_selectedIndex");
      },
      currentIndex: _selectedIndex,
      ),
      body: viewControllerSet[_selectedIndex],
    );
  }

}





class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
