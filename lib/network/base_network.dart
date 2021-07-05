import 'package:dio/dio.dart';

class BaseNetwork {
  factory BaseNetwork() {
    return _singleton;
  }

  BaseNetwork._internal() {
    _init();
  }

  static final BaseNetwork _singleton = BaseNetwork._internal();

  Dio? _dio;

  dynamic _init() {
    _dio = Dio();
    _dio?.options = BaseOptions(
      baseUrl: "https://api.github.com",
    );
  }

  Dio? get ref => _dio;
}

final dioClient = BaseNetwork();
