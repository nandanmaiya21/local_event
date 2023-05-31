import 'package:flutter/material.dart';

class Appstate extends ChangeNotifier {
  int selectedCategoryId = 0;
  void updateCategoryId(int selectedCategoryId) {
    this.selectedCategoryId = selectedCategoryId;
    notifyListeners();
  }

  int get getSelectedCategoryId {
    return selectedCategoryId;
  }
}
