import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static const _apiKey = String.fromEnvironment('API_KEY');
  static Dio? dio;
  static Dio getDio({Map<String, String>? headers}) {
    Duration timeOut = const Duration(seconds: 30);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor();
      addHeader(headers: headers);
    }

    addHeader(headers: headers);
    return dio!;
  }

  static void addHeader({Map<String, String>? headers}) async {
    dio?.options.headers =
        headers ??
        {
          'x-cg-demo-api-key': _apiKey,
          'Content-Type': 'application/x-www-form-urlencoded',
        };
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        request: true,
      ),
    );
  }
}
