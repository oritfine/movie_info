import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  int index = 0;

  setIndex(int val) {
    index = val;
    notifyListeners();
  }
}
