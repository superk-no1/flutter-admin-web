import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

/// dio和http中response冲突
import 'package:dio/dio.dart' as dio;

import '../common/constants.dart';

class HttpService extends GetxService {
  static HttpService get to => Get.find();

  late final Dio _dio;

  @override
  void onInit() {
    super.onInit();

    var option = BaseOptions(
      baseUrl: Constants.hostBaseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    _dio = Dio(option);

    /// 拦截器
    _dio.interceptors.add(RequestInterceptors());

    Future<dio.Response> get(String url,
        {Map<String, dynamic>? params,
        Options? options,
        CancelToken? cancelToken}) async {
      var requestOptions = options ?? Options();
      dio.Response response = await _dio.get(url,
          queryParameters: params,
          options: requestOptions,
          cancelToken: cancelToken);
      return response;
    }

    Future<dio.Response> post(String url,
        {dynamic data, Options? options, CancelToken? cancelToken}) async {
      var requestOptions = options ?? Options();
      dio.Response response = await _dio.post(url,
          data: data ?? {}, options: requestOptions, cancelToken: cancelToken);
      return response;
    }

    Future<dio.Response> put(String url,
        {dynamic data, Options? options, CancelToken? cancelToken}) async {
      var requestOptions = options ?? Options();
      dio.Response response = await _dio.put(url,
          data: data ?? {}, options: requestOptions, cancelToken: cancelToken);
      return response;
    }

    Future<dio.Response> delete(String url,
        {dynamic data, Options? options, CancelToken? cancelToken}) async {
      var requestOptions = options ?? Options();
      dio.Response response = await _dio.delete(url,
          data: data ?? {}, options: requestOptions, cancelToken: cancelToken);
      return response;
    }
  }
}

class RequestInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// super.onRequest(options, handler);
    /// 请求前添加token
    /// if (UserService.to.hasToken) {
    ///   options.headers['Authorization'] = 'Bearer ${UserService.to.token}';
    /// }
    return handler.next(options);
  }

  @override
  void onResponse(dio.Response response, ResponseInterceptorHandler handler) {
    /// 200: 请求成功, 201: 创建成功
    if (response.statusCode != 200 && response.statusCode != 201) {
      handler.reject(
        DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse),
        true,
      );
    } else {
      handler.next(response);
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final exception = HttpException(err.message ?? '');
    switch (err.type) {
      /// 服务端自定义错误处理
      case DioExceptionType.badResponse:
        {
          // final response = err.response;
          // final errorMs = ErrorModel.fromJson(response.data);
          // switch (errorMs.code) {
          //   case 401:
          //     break;
          //   case 403:
          //     break;
          //   case 404:
          //     break;
          //   case 500:
          //     break;
          //   case 502:
          //     break;
          //   default:
          //     break;
          // }
        }
        break;
      case DioExceptionType.cancel:
        break;
      case DioExceptionType.connectionTimeout:
        break;
      default:
        break;
    }
  }
}
