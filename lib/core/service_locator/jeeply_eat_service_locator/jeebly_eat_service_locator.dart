import 'package:get_it/get_it.dart';

import '../../../features/home/jeebly_eat/jeebly_eat_imports.dart';
import '../../http/generic_data_source.dart';

class JeeblyEatServiceLocator {
  static Future<void> init({required GetIt getIt}) async {
    // DataSource
    getIt.registerLazySingleton<CategoryDataSource>(
          () => CategoryDataSourceImpl(getIt<GenericDataSource>()),
    );

    // Bloc
    getIt.registerFactory<CategoryBloc>(
          () => CategoryBloc(getIt<CategoryDataSource>()),
    );
  }
}