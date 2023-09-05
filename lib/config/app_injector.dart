import 'package:get_it/get_it.dart';
import 'package:music_saver/data/repos/songs_repo.dart';
import 'package:music_saver/data/services/songs_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInjector {
  AppInjector._();

  static GetIt getIt = GetIt.instance;

  static SongsRepo songsRepo = getIt<SongsRepo>();

  static Future<void> inject() async {
    await _injectLocalStorages();
    _injectServices();
    _injectRepos();
  }

  static void _injectRepos() {
    getIt.registerSingleton(SongsRepo(songsService: getIt<SongsService>()));
  }

  static void _injectServices() {
    getIt.registerLazySingleton(() => SongsService(sharedPreferences: getIt<SharedPreferences>()));
  }

  static Future<void> _injectLocalStorages() async {
    getIt.registerLazySingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance(),
    );
    await getIt.isReady<SharedPreferences>();
  }
}
