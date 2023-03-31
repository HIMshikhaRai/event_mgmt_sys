import 'package:dio/dio.dart';
import 'package:event_mgmt_sys/api/i_http.dart';

class DioHttp extends IHttp{
  late Dio dio;

  DioHttp._();
  static final DioHttp _instance = DioHttp._();

  factory DioHttp() {
    _instance.dio = Dio();
    return _instance;
  }

  @override
  get(String url) {
    dio.options.headers['content-Type'] = 'application/json';
    return dio.get(url);
  }

  @override
  post(String url, Map data) {
    dio.options.headers['content-Type'] = 'application/json';
    return dio.post(url, data: data);
  }
}