import 'package:dio/dio.dart';

class RateLimitInterceptor extends Interceptor {
  final int maxRequestsPerSecond;
  final Duration resetPeriod;
  int currentRequests = 0;
  DateTime lastReset = DateTime.now();
  final Dio dio;

  RateLimitInterceptor({this.maxRequestsPerSecond = 3, this.resetPeriod = const Duration(seconds: 2) , required this.dio});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final now = DateTime.now();
    if (now.difference(lastReset) >= resetPeriod) {
      currentRequests = 0;
      lastReset = now;
    }

    if (currentRequests >= maxRequestsPerSecond) await Future.delayed(resetPeriod);


    currentRequests++;
    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 429 && (err.response?.realUri.toString().contains('jikan') ?? true)) {
      while(true) {
        await Future.delayed(resetPeriod);
        try {
          handler.resolve(await _retry(err.requestOptions));
          break;
        } on DioException {
          print('retrying');
        }
      }
      return;
    }
    handler.next(err);
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
    );
  }
}
