import 'package:dio/dio.dart';
import 'package:zonka_feedback/services/enum_util.dart';
import 'package:zonka_feedback/services/sharedprefrence_service.dart';
import 'package:zonka_feedback/utils/constants.dart';
import 'package:zonka_feedback/utils/sharedpref_constant.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpUtil {
  late Dio dio;
  late ServerType _serverType;
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.LOGIN_ACCESS_API_PROD,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {"Content-Type": 'application/json'},
      contentType: 'application/json',
      receiveDataWhenStatusError: true,
      responseType: ResponseType.json,
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
        print("onErrordioexception ${e.response}");
        return handler.next(e); //continue
      },
    ));

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
    ));
  }

  void initServerType(ServerType serverType) {
    _serverType = serverType;
  }

  void changeDioUrl({required SetBaseUrl urlType}) {
    if (_serverType == ServerType.PROD) {
      _changeDioBaseUrlProd(urlType: urlType);
    } else {
      _changeDioBaseUrlNightly(urlType: urlType);
    }
  }

  void _changeDioBaseUrlProd({required SetBaseUrl urlType}) {
    switch (urlType) {
      case SetBaseUrl.US:
        dio.options.baseUrl = AppConstants.US_SERVER_API_URL_PROD;
        break;
      case SetBaseUrl.EU:
        dio.options.baseUrl = AppConstants.EU_SERVER_API_URL_PROD;
        break;
      case SetBaseUrl.EMAIL:
        dio.options.baseUrl = AppConstants.CHECK_EMAIL_API_URL_PROD;
        break;
      case SetBaseUrl.LOGIN:
        dio.options.baseUrl = AppConstants.LOGIN_ACCESS_API_PROD;
        break;
      default:
        dio.options.baseUrl = AppConstants.US_SERVER_API_URL_NIGHTLY;
    }
  }

  void _changeDioBaseUrlNightly({required SetBaseUrl urlType}) {
    switch (urlType) {
      case SetBaseUrl.US:
        dio.options.baseUrl = AppConstants.US_SERVER_API_URL_NIGHTLY;
        break;
      case SetBaseUrl.EU:
        dio.options.baseUrl = AppConstants.EU_SERVER_API_URL_NIGHTLY;
        break;
      case SetBaseUrl.EMAIL:
        dio.options.baseUrl = AppConstants.CHECK_EMAIL_API_URL_NIGHTLY;
        break;
      case SetBaseUrl.LOGIN:
        dio.options.baseUrl = AppConstants.LOGIN_ACCESS_API_NIGHTLY;
        break;
      default:
        dio.options.baseUrl = AppConstants.US_SERVER_API_URL_NIGHTLY;
    }
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken =
        MySharedPreferences().getString(SharedPrefConstant.authorizationToken);
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future<dynamic> post(
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
    var response = await dio.post(
      path,
      options: requestOptions, // Use requestOptions here instead of options
      data: data,
      queryParameters: queryParameters,
    );
    print("postrequest $response");
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
    print("response $response");
    return response.data;
  }
}
