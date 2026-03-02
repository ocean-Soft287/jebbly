import 'package:get_it/get_it.dart';
import 'package:jeebly_mobile/features/auth/cubit/login_cubit/login_cubit.dart';
import 'package:jeebly_mobile/features/auth/data/repo/login_data_source.dart';

class AuthServiceLocator {
  static Future<void> execute({required GetIt getIt}) async {
    getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt<LoginDataSource>()),
    );
    getIt.registerLazySingleton<LoginDataSource>(
      () => LoginDataSourceImpl(getIt()),
    );
  }
}
