import 'package:clean_arch_test/core/errors/failure.dart';
import 'package:clean_arch_test/core/params/params.dart';
import 'package:clean_arch_test/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class GetUserRepo {
  Future <Either<Failure,UserEntity>> getUser({required UserParams params});
}