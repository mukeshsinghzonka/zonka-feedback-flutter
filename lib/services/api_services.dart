import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:zonka_feedback/services/sharedprefrence_service.dart';
import 'package:zonka_feedback/utils/constants.dart';
import 'package:zonka_feedback/utils/sharedpref_constant.dart';

class HttpUtil {
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;
  late var logger;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );
    
    logger = Logger(
    printer: PrettyPrinter(),
  );

    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Do something before request is sent
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        // Do something with response data
        return handler.next(response); // continue
      },
      onError: (e, handler) {
        logger.e('Error! Something bad happened', error:e);
      },
    ));
   
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = MySharedPreferences().getString(SharedPrefConstant.authorizationToken);
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};

    Map<String, dynamic>? authorization = getAuthorizationHeader();

    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);
    return response.data;
  }

  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
   var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
    return response.data;
  }
}
