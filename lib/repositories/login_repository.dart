import 'dart:convert';

import 'package:event_mgmt_sys/api/api_call_wrapper.dart';
import 'package:event_mgmt_sys/api/api_constants.dart';
import 'package:event_mgmt_sys/api/result.dart';
import 'package:flutter/foundation.dart';

class LoginRepository {
  LoginRepository._();

  static final LoginRepository _instance = LoginRepository._();

  factory LoginRepository() {
    return _instance;
  }

  final ApiCallWrapper _apiCallWrapper = ApiCallWrapper();

  Future<Result> login(Map data) async {
    const url = '$baseUrl/api/login';
    final Result result = await _apiCallWrapper.makeRequest(url: url, httpType: Http.post, data: data);

    if (result.isSuccess()) {
      final data = result.getValue();
      return Result.success(data);
    } else {
      return Result.error(result.getError());
    }
  }
}
