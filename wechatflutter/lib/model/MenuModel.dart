import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui';

class MenuModel{
  String title;
  IconData icon;
  String image;
  List<String> items;
  BuildContext context;
  Color menuColor;

  MenuModel(
      {this.title,
        this.icon,
        this.image,
        this.items,
        this.context,
        this.menuColor = Colors.black});

}