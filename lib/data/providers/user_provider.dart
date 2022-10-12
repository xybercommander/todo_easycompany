import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  String _name = "";
  String _email = "";

  String get name => _name;
  String get email => _email;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }  

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }  
}