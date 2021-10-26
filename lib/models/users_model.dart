import 'package:flutter/foundation.dart';
import 'package:spending_tracker/interfaces/user.dart';
import 'package:spending_tracker/services/users_service.dart';

import '../setup.dart';

class UsersModel extends ChangeNotifier {

  User? _user;
  User? get user => _user;

  final _usersService = getIt.get<UsersService>();

  Future<void> refreshUser() async {
    this._user = await _usersService.getSingle();
    notifyListeners();
  }

  Future<void> getSingle() async {
    this._user = await _usersService.getSingle();
    notifyListeners();
  }
}
