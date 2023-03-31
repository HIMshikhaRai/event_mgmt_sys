import 'package:dio/dio.dart';
import 'package:event_mgmt_sys/api/dio_http.dart';
import 'package:event_mgmt_sys/api/i_http.dart';
import 'package:event_mgmt_sys/api/result.dart';

enum Http {get, post}

class ApiCallWrapper {
  late IHttp _iHttp;

  ApiCallWrapper._();

  static final ApiCallWrapper _instance = ApiCallWrapper._();

  factory ApiCallWrapper() {
    _instance._iHttp = DioHttp();
    return _instance;
  }

  Future<Result> makeRequest({String? url, Http httpType = Http.get, Map? data}) async {
    try {
      Response? response;
      if (httpType == Http.get) {
        response = await _iHttp.get(url!);
      } else if (httpType == Http.post) {
        response = await _iHttp.post(url!, data!);
      }
      return Result.success(response?.data);
    } catch (error) {
      error as DioError;
      return Result.error(DataError(error.response?.statusMessage ?? "Something went wrong",
          error.response?.statusCode ?? 0));
    }
  }
}
