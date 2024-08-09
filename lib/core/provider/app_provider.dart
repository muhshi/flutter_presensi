import 'package:flutter/cupertino.dart';

abstract class AppProvider with ChangeNotifier {
  bool _isLoading = false;
  bool _isDispose = false;
  String _errorMessage = '';
  String _successMessage = '';

  bool get isLoading => _isLoading;
  bool get isDispose => _isDispose;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;

  set errorMessage(String param) => _errorMessage = param;
  set successMessage(String param) => _successMessage = param;

  void showLoading() {
    _isLoading = true;
    notifyListeners();
  }

  void init();

  @override
  void dispose() {
    _isDispose = true;
    super.dispose();
  }
}
