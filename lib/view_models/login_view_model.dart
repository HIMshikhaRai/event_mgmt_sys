import 'package:event_mgmt_sys/api/result.dart';
import 'package:event_mgmt_sys/repositories/login_repository.dart';
import 'package:event_mgmt_sys/utils/shared_pref_helper.dart';
import 'package:event_mgmt_sys/utils/status_enum.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  Status _status = Status.success;

  final LoginRepository _loginRepository = LoginRepository();

  Future<Status> login(Map data) async {
    if (status != Status.loading) status = Status.success;
    Result result = await _loginRepository.login(data);
    if (result.isSuccess()) {
      status = Status.success;
      SharedPrefHelper().setBoolToPref(isLoggedIn, true);
    } else {
      status = Status.error;
    }
    return status;
  }

  Status get status => _status;

  set status(Status value) {
    _status = value;
    notifyListeners();
  }
}