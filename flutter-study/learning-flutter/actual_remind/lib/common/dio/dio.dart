import 'package:actual_remind/common/const/data.dart';
import 'package:actual_remind/common/secure_storage/secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dioProvider = Provider((ref) {
  final dio = Dio();

  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(
    CustomInterceptor(storage: storage),
  );

  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({
    required this.storage,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');

      final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

      options.headers.addAll({
        'authorization': 'Bearer $accessToken',
      });
    }

    if (options.headers['refreshToken'] == 'true') {
      options.headers.remove('refreshToken');

      final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

      options.headers.addAll({
        'authorization': 'Bearer $refreshToken',
      });
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);

    if (refreshToken == null) {
      return handler.reject(err);
    }
    final isStatus401 = err.response?.statusCode == 401;
    final isRefreshInvalid = err.requestOptions.path == '/auth/token';

    if (isStatus401 && !isRefreshInvalid) {
      final dio = new Dio();

      try {
        final resForRequestAccessToken = await dio.get(
          'http://$IP/auth/token',
          options: Options(
            headers: {
              'authorization': 'Bearer ${refreshToken}',
            },
          ),
        );
        final accessToken = resForRequestAccessToken.data['accessToken'];
        final options = err.requestOptions;
        options.headers.addAll({
          'authorization': 'Bearer $accessToken',
        });
        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
        final resForRequestRefreshToken = await dio.fetch(options);

        return handler.resolve(resForRequestRefreshToken);
      } catch (e) {
        handler.reject(err);
      }
    }

    super.onError(err, handler);
  }
}
