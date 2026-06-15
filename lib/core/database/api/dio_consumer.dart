import 'package:clean_arch_test/core/database/api/api_consumer.dart';
import 'package:clean_arch_test/core/database/api/end_points.dart';
import 'package:clean_arch_test/core/errors/expentions.dart';
import 'package:dio/dio.dart';

class DioConsumer extends ApiConsumer {
  final Dio api;

  DioConsumer({required this.api}) {
    api.options.baseUrl = EndPoints.baseUrl;
    // api.options.headers;
    api.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }

  @override
  Future get(String path, {Map<String, dynamic>? queryParameters, data}) async {
    try {
      final response =await api.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handleDioException(e);
    }   
  }

  @override
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    bool isFormData = false,
  }) async {
    await api.post(path);
  }

  @override
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    bool isFormData = false,
  }) async {
    await api.delete(path);
  }

  @override
  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    data,
    bool isFormData = false,
  }) async {
    await api.patch(path);
  }
}
