// ignore_for_file: avoid_redundant_argument_values
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:p2p_car_renting/global/dio/app_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

String baseUrl =
    'https://firestore.googleapis.com/v1/projects/p2p-renting-car/databases/(default)';

@lazySingleton
class DioClient {
  factory DioClient() {
    return _instance;
  }

  DioClient._();

  static final DioClient _instance = DioClient._();

  late final Dio _dio;

  @PostConstruct(preResolve: true)
  Future<void> init() async {
    final baseOptions = BaseOptions(
      baseUrl: baseUrl,
    );

    _dio = Dio(baseOptions);
    _dio.interceptors.add(AppInterceptor());
    _dio.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        maxWidth: 98,
        logPrint: dioPrint,
      ),
    );
  }

  Future<Response<dynamic>> get(
    String endpoint, {
    Map<String, dynamic>? queries,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.get(
      endpoint,
      queryParameters: queries,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.post(
      endpoint,
      queryParameters: queryParameters,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> delete(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.delete(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> put(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.put(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
  }

  Future<Response<dynamic>> patch(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? headers,
  }) async {
    return _dio.patch(
      endpoint,
      data: data,
      options: Options(headers: headers),
    );
  }
}

void dioPrint(Object object) {
  debugPrint(object.toString());
}
