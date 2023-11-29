import 'package:dio/dio.dart';
import 'package:firebase_getx_boilerplate/app/data/provider/api_interface.dart';

class ScapeInterceptor extends Interceptor {
  final Dio _dioInstance;
  ScapeInterceptor(this._dioInstance);

  //onRequest
  //onError
}

class ScapeApiProvider implements ScapeApiInterface {
  final Dio dio = Dio();
  final baseUrl = "https:...";

  ScapeApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(ScapeInterceptor(dio));
  }

  @override
  Future<void> getInfo() async {
    String url = "/test";
    dio.post(url);
  }
}
