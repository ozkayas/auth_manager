import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    box.read(CacheManagerKey.TOKEN.toString());
  }
}

enum CacheManagerKey { TOKEN }