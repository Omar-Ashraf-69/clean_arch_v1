import 'package:clean_arch_test/core/database/api/api_consumer.dart';
import 'package:clean_arch_test/core/database/api/end_points.dart';
import 'package:clean_arch_test/core/params/params.dart';
import 'package:clean_arch_test/features/user/data/models/user_model.dart';

class UserRemoteDataSource {
  final ApiConsumer api;

  UserRemoteDataSource({required this.api});

  Future<UserModel> getUser({required UserParams params}) async {
    final response = await api.get("${EndPoints.user}/${params.id}");
    return UserModel.fromJson(response);
  }
}
