import 'dart:convert';

import 'package:event_mgmt_sys/api/api_call_wrapper.dart';
import 'package:event_mgmt_sys/api/api_constants.dart';
import 'package:event_mgmt_sys/api/result.dart';
import 'package:event_mgmt_sys/models/event.dart';
import 'package:flutter/foundation.dart';

class EventRepository {
  EventRepository._();

  static final EventRepository _instance = EventRepository._();

  factory EventRepository() {
    return _instance;
  }

  final ApiCallWrapper _apiCallWrapper = ApiCallWrapper();

  Future<Result> getAllEvents() async {
    const url = '$baseUrl/api/events';
    final Result result = await _apiCallWrapper.makeRequest(url: url);

    if (result.isSuccess()) {
      final data = await compute(eventFromJson, jsonEncode(result.getValue()));
      return Result.success(data);
    } else {
      return Result.error(result.getError());
    }
  }

  Future<Result> getEvents(String address) async {
    final url = '$baseUrl/api/events/$address';
    final Result result = await _apiCallWrapper.makeRequest(url: url);

    if (result.isSuccess()) {
      final data = await compute(eventFromJson, jsonEncode(result.getValue()));
      return Result.success(data);
    } else {
      return Result.error(result.getError());
    }
  }

  Future<Result> filterEventsByDate(String address, String startDate, String endDate) async {
    final url = '$baseUrl/api/events/address/$address/start/$startDate/end/$endDate';
    final Result result = await _apiCallWrapper.makeRequest(url: url);

    if (result.isSuccess()) {
      final data = await compute(eventFromJson, jsonEncode(result.getValue()));
      return Result.success(data);
    } else {
      return Result.error(result.getError());
    }
  }
}
