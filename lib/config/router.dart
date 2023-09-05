import 'package:flutter/cupertino.dart';
import 'package:music_saver/domain/models/ui/songs_category.dart';
import 'package:music_saver/domain/models/ui/storage_type_enum.dart';
import 'package:music_saver/features/home/pages/home_page.dart';
import 'package:music_saver/features/songs_category/pages/songs_category_page.dart';
import 'package:music_saver/features/storage/pages/storage_page.dart';

class AppRouter {
  AppRouter._();

  static PageRoute? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.route:
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const HomePage(),
        );
      case SongsCategoryPage.route:
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => SongsCategoryPage(
            songsCategory: settings.arguments as SongsCategory,
          ),
        );
      case StorageSongsPage.route:
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => StorageSongsPage(
            storageType: settings.arguments as StorageType,
          ),
        );
      default:
        return null;
    }
  }
}
