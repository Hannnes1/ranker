import 'package:flutter/material.dart';
import 'package:ranker/enums/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;

  void setState([ViewState viewState]) {
    _state = viewState ?? ViewState.Idle;
    notifyListeners();
  }
}
