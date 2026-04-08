part of 'local_storage.dart';

class ProductPaginatedCache<T> implements IPaginatedCache<T> {
  final HiveServiceImpl hiveService;

  ProductPaginatedCache(this.hiveService);

  @override
  Future<void> cachePage(List<T> items, {required String cacheKey}) async {
    final box = await Hive.openBox<T>(cacheKey);
    await box.clear();
    await box.putAll(items.asMap());
  }

  @override
  Future<List<T>> getCachedPage({required String cacheKey}) async {
    final box = await Hive.openBox<T>(cacheKey);
    return box.values.toList();
  }

  @override
  Future<void> clearCachedPage({required String cacheKey}) async {
    final box = await Hive.openBox<T>(cacheKey);
    await box.clear();
  }
}
