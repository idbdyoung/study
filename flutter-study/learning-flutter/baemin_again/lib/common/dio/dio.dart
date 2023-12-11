import 'package:baemin_again/common/const/data.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class CustomInterceptor extends Interceptor {
  FlutterSecureStorage storage;

  CustomInterceptor({
    required this.storage,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['accessToken'] == 'true') {
      final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

      options.headers.remove('accessToken');
      options.headers.addAll({
        'authorization': 'Bearer $accessToken'
      });
    }

    if (options.headers['refreshToken'] == 'true') {
      final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

      options.headers.remove('refreshToken');
      options.headers.addAll({
        'authorization': "Bearer $refreshToken"
      });
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}
