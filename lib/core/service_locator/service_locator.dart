import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;
abstract interface class DI {
static Future<void> getItInit() async {
      // await SharedServiceLocator.execute(getIt: getIt);
}
static Future<void> resetGetItAndInit() async {
    // Reset all registrations and singletons, disposing instances where possible
    await getIt.reset(dispose: true);
    // Re-run initialization sequence
    await getItInit();
  }
}