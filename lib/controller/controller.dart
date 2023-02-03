import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gedox_task/service/service.dart';

import '../model/model.dart';

class Controller with ChangeNotifier {
  Controller() {
    getAll();
  }

  Model? model;
  bool isLoading = false;
  void getAll() async {
    log('start');
    isLoading = true;
    notifyListeners();
    model = await GetService.getService();
    log('end');
    isLoading = false;
    notifyListeners();
  }
}
