import 'package:clean_arch_test/core/params/params.dart';
import 'package:clean_arch_test/core/utils/service_locator.dart';
import 'package:clean_arch_test/features/user/data/repos/user_repo_impl.dart';
import 'package:clean_arch_test/features/user/domain/usecases/get_user.dart';
import 'package:clean_arch_test/features/user/presentation/cubit/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  Future<void> eitherFailureOrUser(int id) async {
    emit(GetUserLoading());
    final response = await GetUser(
      repo: getIt<UserRepoImpl>(),
    ).call(params: UserParams(id: id.toString()));
    response.fold(
      (error) => emit(GetUserFailure(errMessage: error.errMessage)),
      (user) => emit(GetUserSuccessfully(user: user)),
    );
  }
}
