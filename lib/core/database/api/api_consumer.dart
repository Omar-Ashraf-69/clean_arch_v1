abstract class ApiConsumer {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
  });
  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isFormData = false,
  });
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isFormData = false,
  });
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isFormData = false,
  });
}
