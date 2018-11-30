import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';

List<CameraDescription> cameras;

class QRCodeHomeView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QRCodeHomeViewState();
  }

}

class _QRCodeHomeViewState extends State<QRCodeHomeView> with SingleTickerProviderStateMixin{

  QRReaderController controller;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  AnimationController animationController;

  Animation<double> verticalPosition;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new MaterialApp(
          home: new Scaffold(
            key: _scaffoldKey,
            appBar: new AppBar(
              title: const Text("扫一扫"),

            ),
            floatingActionButton: FloatingActionButton(
                onPressed:(){
                  showInSnackBar(" this  is debug info ");

                }
            ),
            body: new Stack(
              children: <Widget>[
                new Container(
                  child: new Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: new Center(
                        child: _cameraPreviewWidget(),
                      ),
                  ),

                ),
                Center(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        height: 300.0,
                        width: 300.0,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red,width: 2.0)
                          ),
                        ),
                      ),
                      Positioned(
                          top: verticalPosition.value,
                          child: Container(
                           width: 300.0,
                           height: 2.0,
                           color: Colors.red,
                          )
                      )

                    ],
                  ),

                )
              ],
            )
            ,
          ),
    );
//    return new Scaffold(
//      appBar: new AppBar(title: new Text("扫一扫"),),
//      floatingActionButton: new FlatButton(
//          onPressed:(){
//            shows
//          },
//          child:
//      ),
//      body: new ListTile(
//        title: new Text("扫一扫"),
//
//
//        /*
//        *  CupertinoSliverNavigationBar(
//                border: Border(bottom: BorderSide.none),
//                backgroundColor: CupertinoColors.white,
//                largeTitle: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Text(UIData.appName),
//                    Padding(
//                      padding: const EdgeInsets.only(right: 16.0),
//                      child: CircleAvatar(
//                        radius: 15.0,
//                        backgroundColor: CupertinoColors.black,
//                        child: FlutterLogo(
//                          size: 15.0,
//                          colors: Colors.yellow,
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//        *
//        *
//        *
//        *
//        * */
//
//
//
//      ),
//    );
  }

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();

    try {
      cameras = await availableCameras();
    } on QRReaderException catch (e){
      //Error(e.code,e.description);
      //print('Error: $(e.code)\nError Message: $(e.description)');
    }

    animationController = new AnimationController(
        vsync: this ,
        duration: new Duration(seconds: 3),
    );
    animationController.addListener((){
      this.setState((){});
    });
    animationController.forward();
    verticalPosition = Tween(begin: 0.0 ,end: 300.0).animate(CurvedAnimation(parent: animationController, curve: Curves.linear))
//    verticalPosition = Tween<double>(begin: 0.0, end: 300.0).animate(
//        CurvedAnimation(parent: animationController, curve: Curves.linear))
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          animationController.reverse();
        } else if (state == AnimationStatus.dismissed) {
          animationController.forward();
        }
      });
    onNewCameraSelected(cameras[0]);

  }

  /// Display the preview from the camera (or a message if the preview is not available).
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'No camera selected',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
        ),
      );
    } else {
      return new AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: new QRReaderPreview(controller),
      );
    }
  }

  void onCodeRead(dynamic value) {
    showInSnackBar(value.toString());
    // ... do something
    // wait 5 seconds then start scanning again.
    new Future.delayed(const Duration(seconds: 5), controller.startScanning);
  }




  void onNewCameraSelected(CameraDescription cameraDescription)async {
    if (controller != null) {
      await controller.dispose();
    }
    controller = new QRReaderController(cameraDescription, ResolutionPreset.low,
        [CodeFormat.qr, CodeFormat.pdf417], onCodeRead);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showInSnackBar('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on QRReaderException catch (e) {
      //print('Error: $(e.code)\nError Message: $(e.description)');
      //logError(e.code, e.description);
      showInSnackBar('Error: ${e.code}\n${e.description}');
    }

    if (mounted) {
      setState(() {});
      controller.startScanning();
    }



  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(message)));
  }

}