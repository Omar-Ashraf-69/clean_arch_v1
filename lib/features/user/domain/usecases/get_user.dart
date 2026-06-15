import 'package:clean_arch_test/core/errors/failure.dart';
import 'package:clean_arch_test/core/params/params.dart';
import 'package:clean_arch_test/features/user/domain/entities/user_entity.dart';
import 'package:clean_arch_test/features/user/domain/repositories/get_user_repo.dart';
import 'package:dartz/dartz.dart';

class GetUser {
  final GetUserRepo repo;

  GetUser({required this.repo});
  Future<Either<Failure, UserEntity>> call({required UserParams params}) {
    return repo.getUser(params: params);
  }
}
