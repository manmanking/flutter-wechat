import 'dart:async';
import 'package:wechatflutter/Logic/MenuViewModel.dart';
import 'package:wechatflutter/model/MenuModel.dart';

class MenuBloc{

  final _menuVM = MenuViewModel();
  final menuController = StreamController<List<MenuModel>>();
  Stream<List<MenuModel>> get menuItems =>menuController.stream;
  MenuBloc(){
    menuController.add(_menuVM.getMenuItems());

  }


}