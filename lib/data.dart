import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  int index = 1;

  setIndex(int val) {
    index = val;
    notifyListeners();
  }
}
