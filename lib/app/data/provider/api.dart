import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:scape/app/data/models/account.dart';
import 'package:scape/app/data/models/email.dart';
import 'package:scape/app/data/provider/api_interface.dart';
import 'package:scape/app/data/service/auth/service.dart';

class ScapeInterceptor extends Interceptor {
  final Dio _dioInstance;
  ScapeInterceptor(this._dioInstance);

  //onRequest
  //onError
}

class LogInterceptor extends Interceptor {
  final Dio _dioInstance;
  LogInterceptor(this._dioInstance);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => PATH: ${options.path}');
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return handler.next(err);
  }
}

class JWTInterceptor extends Interceptor {
  final Dio _dioInstance;

  // Dependency Injection
  JWTInterceptor(this._dioInstance);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path == '/users/auth/refresh') {
      return handler.next(options);
    }

    AuthService authService = Get.find<AuthService>();

    if (options.path == '/users/auth/google') {
      options.headers['Google-Id-Token'] = '${authService.googleIdToken}';
    } else if (authService.isAuthenticated) {
      options.headers['Authorization'] = 'Bearer ${authService.accessToken}';
    }

    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    AuthService authService = Get.find<AuthService>();
    //refresh api가 401시 무한 루프 방지
    if (err.response?.requestOptions.path == '/users/auth/refresh') {
      return handler.next(err);
    }

    if (err.response?.statusCode == 401 &&
        authService.accessToken != null &&
        JwtDecoder.isExpired(authService.accessToken!)) {
      try {
        await authService.refreshAcessToken();

        //api 호출을 다시 시도함
        final Response response = await _dioInstance.fetch(err.requestOptions);
        return handler.resolve(response);
      } catch (e) {
        //refresh 실패 시 401을 그대로 반환
        return handler.next(err);
      }
    }
    return handler.next(err);
  }
}

class ScapeApiProvider implements ScapeApiInterface {
  final Dio dio = Dio();
  final baseUrl = "https://scape.apps.sys.paas-ta-dev10.kr";

  ScapeApiProvider() {
    dio.options.baseUrl = baseUrl;
    dio.interceptors.add(ScapeInterceptor(dio));
    dio.interceptors.add(JWTInterceptor(dio));
    dio.interceptors.add(LogInterceptor(dio));
  }

  @override
  Future<Map> loginWithGoogle() async {
    String url = "/users/auth/google";
    try {
      Response response = await dio.get(url);
      log(response.data.toString());
      return response.data;
    } on DioError catch (_) {
      rethrow;
    }
  }

  //ACCOUNT
  @override
  Future<void> createAccount(Map data) async {
    String url = "/accounts";

    try {
      await dio.post(url, data: data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Account>> getAccount() async {
    String url = "/accounts";
    try {
      Response response = await dio.get(url);
      return (response.data as List)
          .map((account) => Account.fromJson(account))
          .toList();
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteAccount(String id) async {
    String url = "/accounts/$id";
    try {
      await dio.delete(url);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> updateAccount(String id, Map data) async {
    String url = "/accounts/$id";
    try {
      await dio.put(url, data: data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<Email> createEmail() async {
    String url = "/emails";
    try {
      Response response = await dio.post(url);
      log("createEmail : ${response.data.toString()}");
      return Email.fromJson(response.data);
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Email>> getEmail() async {
    String url = "/emails";
    try {
      Response response = await dio.get(url);
      return (response.data as List)
          .map((email) => Email.fromJson(email))
          .toList();
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<EmailMessage>> getEmailMessage() async {
    String url = "/emails/messages";
    try {
      Response response = await dio.get(url,
          options: Options(
              sendTimeout: 60 * 1000, // 60 seconds
              receiveTimeout: 60 * 1000));
      return (response.data as List)
          .map((emailMessage) => EmailMessage.fromJson(emailMessage))
          .toList();
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<Stream<String>> chatWithOpenAi(Map data) async {
    String url = "https://dev-api.dimipay.io/scape/chat/stream";

    try {
      Response response = await dio.post<ResponseBody>(
        url,
        data: data,
        options: Options(
          // utf-8로 인코딩된 스트림을 받기 위해 responseType을 stream으로 설정
          headers: {"Accept": "text/event-stream", "charset": "utf-8"},
          responseType: ResponseType.stream,
        ),
      );

      return utf8.decoder
          .bind(response.data?.stream)
          .transform(StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          if (data != ':\n\n') {
            sink.add(data);
          }
        },
      ));
    } on DioError catch (_) {
      rethrow;
    }
  }

  @override
  Future<Map> refreshAccessToken(String refreshToken) async {
    String url = "/users/auth/refresh";
    try {
      Response response =
          await dio.post(url, data: {"refreshToken": refreshToken});
      return response.data;
    } on DioError catch (_) {
      rethrow;
    }
  }
}
