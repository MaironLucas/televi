import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:televi/core/exceptions.dart';

class MyDio extends DioForNative {
  MyDio([BaseOptions? options]) : super(options);

  @override
  Future<Response<T>> request<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) =>
      super
          .request<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        options: options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      )
          .catchError((error) {
        if (error is DioException) {
          if (error.type != DioExceptionType.connectionTimeout) {
            throw MyException(MyErrorType.responseError);
          } else {
            throw MyException(MyErrorType.timeoutError);
          }
        } else {
          throw MyException(MyErrorType.unknowError);
        }
      });
}
