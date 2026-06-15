import 'package:clean_arch_test/core/connection/connection.dart';
import 'package:clean_arch_test/core/database/api/dio_consumer.dart';
import 'package:clean_arch_test/core/database/cache/cache_helper.dart';
import 'package:clean_arch_test/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_arch_test/features/user/data/datasources/user_remote_data_source.dart';
import 'package:clean_arch_test/features/user/data/repos/user_repo_impl.dart';
import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

// await GetUser(
//   repo: UserRepoImpl(
//     networkInfo: NetworkInfo(connectionChecker: DataConnectionChecker()),
//     localUser: UserLocalDataSource(cacheHelper: CacheHelper()),
//     remoteUser: UserRemoteDataSource(api: DioConsumer(api: Dio())),
//   ),
// )
void initGetIt() {
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer(api: Dio()));
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(api: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDataSource(cacheHelper: getIt<CacheHelper>()),
  );
  getIt.registerLazySingleton<NetworkInfo>(
    () => NetworkInfo(connectionChecker: DataConnectionChecker()),
  );
  getIt.registerLazySingleton<UserRepoImpl>(
    () => UserRepoImpl(
      networkInfo: getIt<NetworkInfo>(),
      localUser: getIt<UserLocalDataSource>(),
      remoteUser: getIt<UserRemoteDataSource>(),
    ),
  );
}
