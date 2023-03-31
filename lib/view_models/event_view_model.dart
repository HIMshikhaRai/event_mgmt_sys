import 'package:event_mgmt_sys/api/result.dart';
import 'package:event_mgmt_sys/models/event.dart';
import 'package:event_mgmt_sys/repositories/event_repository.dart';
import 'package:event_mgmt_sys/utils/status_enum.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EventViewModel extends ChangeNotifier{
  Status _status = Status.success;
  List<Event>? _events = [];
  DataError? _dataError;
  DateTime? _selectedStartDate, _selectedEndDate;
  String? address;

  final EventRepository _eventRepository = EventRepository();

  void init() {
    _status = Status.loading;
  }

  Future<Status> getAllEvents() async {
    _events?.clear();
    if (status != Status.loading) status = Status.success;
    Result result = await _eventRepository.getAllEvents();
    if (result.isSuccess()) {
      _events = result.getValue();
      status = Status.success;
    } else {
      _dataError = result.getError();
      status = Status.error;
    }
    return status;
  }

  Future<Status> getEvents(String address) async {
    this.address = address;
    _events?.clear();
    if (status != Status.loading) status = Status.loading;
    Result result = await _eventRepository.getEvents(address);
    if (result.isSuccess()) {
      _events = result.getValue();
      status = Status.success;
    } else {
      _dataError = result.getError();
      status = Status.error;
    }
    return status;
  }

  Future<Status> filterEventsByDate() async {
    if (status != Status.loading) status = Status.loading;
    Result result = await _eventRepository.filterEventsByDate(address?? "", selectedStartDate.toString(), selectedEndDate.toString());
    if (result.isSuccess()) {
      _events = result.getValue();
      if (_events!.isEmpty) Fluttertoast.showToast(msg: "No events found");
      status = Status.success;
    } else {
      _dataError = result.getError();
      status = Status.error;
    }
    return status;
  }

  Status get status => _status;

  set status(Status value) {
    _status = value;
    notifyListeners();
  }

  List<Event>? get events => _events;

  set events(List<Event>? value) {
    _events = value;
  }

  DataError? get dataError => _dataError;

  set dataError(DataError? value) {
    _dataError = value;
  }

  DateTime? get selectedEndDate => _selectedEndDate;

  set selectedEndDate(DateTime? value) {
    _selectedEndDate = value;
    notifyListeners();
  }

  DateTime? get selectedStartDate => _selectedStartDate;

  set selectedStartDate(DateTime? value) {
    _selectedStartDate = value;
    notifyListeners();
  }

  void initializeDate() {
    _selectedStartDate = null;
    _selectedEndDate = null;
  }
}