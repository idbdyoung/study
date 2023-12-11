import 'package:baemin/common/const/data.dart';
import 'package:baemin/common/secure_storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dioProvider = Provider((ref) {
  final dio = Dio();

  final storage = ref.watch(secureStoreProvider);

  dio.interceptors.add(
    CustomIntercepter(
      storage: storage,
    ),
  );

  return dio;
});

class CustomIntercepter extends Interceptor {
  final FlutterSecureStorage storage;

  CustomIntercepter({
    required this.storage,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['accessToken'] == 'true') {
      final token = await storage.read(key: ACCESS_TOKEN_KEY);

      options.headers.remove('accessToken');
      options.headers.addAll({'authorization': 'Bearer $token'});
    }

    if (options.headers['refreshToken'] == 'true') {
      final token = await storage.read(key: REFRESH_TOKEN_KEY);

      options.headers.remove('refreshToken');
      options.headers.addAll({'authorization': 'Bearer $token'});
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final forRefreshToken = err.requestOptions.path == '/path/token';
      final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

      if (forRefreshToken || refreshToken == null) {
        return handler.reject(err);
      }

      if (!forRefreshToken) {
        final dio = Dio();

        try {
          final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
          final resp = await dio.post(
            'http://$ip/auth/token',
            options: Options(
              headers: {
                'authorization': 'Bearer $refreshToken',
              },
            ),
          );
          final accessToken = resp.data['accessToken'];
          await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

          final options = err.requestOptions;
          options.headers.addAll({'authorization': 'Bearer $accessToken'});

          final respose = await dio.fetch(options);

          handler.resolve(respose);
        } on DioException catch (e) {
          return handler.reject(e);
        }
      }
    }
    super.onError(err, handler);
  }
}
