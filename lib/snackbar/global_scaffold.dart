import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();

  final scafoldKey = GlobalKey<ScaffoldState>();

  void showSnackbar(SnackBar snackBar) {
    scafoldKey.currentState.showSnackBar(snackBar);
  }
}