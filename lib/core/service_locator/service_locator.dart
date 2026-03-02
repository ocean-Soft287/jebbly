import 'package:get_it/get_it.dart';
import 'package:jeebly_mobile/core/service_locator/auth_service_locator/auth_service_locator.dart';
import 'package:jeebly_mobile/core/service_locator/shared_service_locator/shared_service_locator.dart';

final GetIt getIt = GetIt.instance;

abstract interface class DI {
  static Future<void> getItInit() async {
    await SharedServiceLocator.execute(getIt: getIt);
    await AuthServiceLocator.execute(getIt: getIt);
  }

  static Future<void> resetGetItAndInit() async {
    // Reset all registrations and singletons, disposing instances where possible
    await getIt.reset(dispose: true);
    // Re-run initialization sequence
    await getItInit();
  }
}
