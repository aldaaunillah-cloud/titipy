import 'package:flutter/material.dart';

class JastipProvider extends ChangeNotifier {

  List dataJastip = [];

  void setJastip(List newData) {

    dataJastip = newData;

    notifyListeners();

  }

}