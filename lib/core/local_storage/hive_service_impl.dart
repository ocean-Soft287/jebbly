part of "local_storage.dart";

class HiveServiceImpl implements IUserCache,ITokenCache,IThemeCache{


  // ---------------------- Boxes ----------------------
  static const String userBoxName = 'user_box';
  static const String tokenBoxName = 'token_box';


  // ----------------------- Keys ----------------------
  static const String currentUserKey = 'current_user';
  static const String accessTokenKey = 'access_token';


  // ---------------------- Theme ----------------------
  static const String themeBoxName = 'theme_box';
  static const String themeModeKey = 'theme_mode';
  static Box<String>? _themeBox;

  static Box<UserModel>? _userBox;
  static Box<UserToken>? _tokenBox;

  const HiveServiceImpl._();

  static final HiveServiceImpl instance = HiveServiceImpl._();

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserModelAdapter());
    Hive.registerAdapter(UserTokenAdapter());
    // //open boxes
    _userBox = await Hive.openBox<UserModel>(userBoxName);
    _tokenBox = await Hive.openBox<UserToken>(tokenBoxName);
    _themeBox = await Hive.openBox<String>(themeBoxName);
  }
  // ---------------------- User ----------------------


// ------------------- Paginated Cache ---------------------
  Future<void> _cachePage<T>(List<T> items, {required String cacheKey}) async {
    final box = await Hive.openBox<T>(cacheKey);
    await box.putAll(items.asMap());
  }

// Generic retrieval method
  Future<List<T>> _getCachedPage<T>({required String cacheKey}) async {
    final box = await Hive.openBox<T>(cacheKey);
    return box.values.toList();
  }

// Generic clear method
  Future<void> _clearCachedPage<T>({required String cacheKey}) async {
    final box = await Hive.openBox<T>(cacheKey);
    await box.clear();
  }

  // ---------------------- Theme ----------------------
  @override
  Future<void> saveThemeMode(String themeMode) async {
    await _themeBox?.put(themeModeKey, themeMode);
    loggerInfo('Theme mode saved: $themeMode');
  }

  @override
  String? getThemeMode() {
    final theme = _themeBox?.get(themeModeKey);
    if (theme != null) {
      loggerInfo('Retrieved theme mode from cache: $theme');
    }
    return theme;
  }

  @override
  Future<void> clearThemeMode() async {
    await _themeBox?.delete(themeModeKey);
    loggerInfo('Theme mode cleared');
  }


// ------------------ Generic ---------------------
  static Future<Box<E>> openBox<E>(String boxName) async {
    if (Hive.isBoxOpen(boxName)) return Hive.box<E>(boxName);
    return await Hive.openBox<E>(boxName);
  }

  static Future<void> put<E>(String boxName, dynamic key, E value) async {
    final box = await openBox<E>(boxName);
    await box.put(key, value);
  }

  static Future<E?> get<E>(String boxName, dynamic key) async {
    final box = await openBox<E>(boxName);
    return box.get(key);
  }

  static Future<void> delete<E>(String boxName, dynamic key) async {
    final box = await openBox<E>(boxName);
    await box.delete(key);
  }

  static Future<void> clearBox<E>(String boxName) async {
    final box = await openBox<E>(boxName);
    await box.clear();
  }

  static Future<void> closeBox<E>(String boxName) async {
    final box = Hive.box<E>(boxName);
    await box.close();
  }

  Future<void> clearAll() async {
    await _userBox?.clear();
    await _tokenBox?.clear();
    await _themeBox?.clear();
  }
  
  @override
  Future<void> clearAccessToken() async {
    await _tokenBox?.delete(accessTokenKey);
  }
  
  @override
  Future<void> clearUserModel() async {
await _userBox?.delete(currentUserKey);  
  }
  
  @override
  UserToken? getAccessToken() {
    return _tokenBox?.get(accessTokenKey);
  }
  
  @override
  Future<void> saveAccessToken(UserToken token) async {
   await _tokenBox?.put(accessTokenKey, token);
  }
  
  

  @override
  Future<void> cacheUserModel(UserModel user) async {
    await _userBox?.put(currentUserKey, user);
  }

  @override
  UserModel? getCachedUserModel() {
    final user = _userBox?.get(currentUserKey);
    if (user != null) {
      // loggerVerbose('User fields: ${user.toJson()}'); // Make sure toJson() exists
    }
    return user;
  }
  
}

