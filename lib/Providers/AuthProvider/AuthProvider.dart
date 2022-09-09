import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;

  set setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  initAuth() {
    _isLoading = false;
  }
}
