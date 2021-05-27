import 'dart:async';
import 'package:flutter_sqlite/models/user.dart';
import 'package:flutter_sqlite/data/database_helper.dart';

class RestData {
  // ignore: non_constant_identifier_names
  static final BASE_URL = "";
  // ignore: non_constant_identifier_names
  static final LOGIN_URL = BASE_URL + "/";

  Future<User> login(String username, String password) async {
    String flagLogged = "logged";
    //simulate internet connection by selecting the local database to check if user has already been registered
    var user = new User('', username, password, '');
    var db = new DatabaseHelper();
    var userRetorno = new User('', '', '', '');
    userRetorno = (await db.selectUser(user))!;
    // ignore: unnecessary_null_comparison
    if (userRetorno != null) {
      flagLogged = "logged";
      print('about to log');
      return new Future.value(new User('', username, password, flagLogged));
    } else {
      flagLogged = "not";
      print('not logged');
      return new Future.value(new User('', username, password, flagLogged));
    }
  }
}
