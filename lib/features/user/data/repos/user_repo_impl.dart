import 'package:clean_arch_test/core/connection/connection.dart';
import 'package:clean_arch_test/core/errors/expentions.dart';
import 'package:clean_arch_test/core/errors/failure.dart';
import 'package:clean_arch_test/core/params/params.dart';
import 'package:clean_arch_test/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_arch_test/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_arch_test/features/user/domain/entities/user_entity.dart';
import 'package:clean_arch_test/features/user/domain/repositories/get_user_repo.dart';
import 'package:dartz/dartz.dart';

class UserRepoImpl extends GetUserRepo {
  final NetworkInfo networkInfo;
  final UserLocalDataSource localUser;
  final UserRemoteDataSource remoteUser;

  UserRepoImpl({
    required this.networkInfo,
    required this.localUser,
    required this.remoteUser,
  });
  @override
  Future<Either<Failure, UserEntity>> getUser({
    required UserParams params,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteUser.getUser(params: params);
        return right(response);
      } on ServerException catch (e) {
        return left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final response = await localUser.getUser();
        return right(response);
      } on CacheExeption catch (e) {
        return left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
