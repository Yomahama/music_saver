import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_saver/config/app_injector.dart';
import 'package:music_saver/config/router.dart';
import 'package:music_saver/constants/theme/theme.dart';
import 'package:music_saver/features/home/bloc/songs_bloc.dart';
import 'package:music_saver/features/storage/blocs/filesystem_songs/filesystem_songs_bloc.dart';
import 'package:music_saver/features/storage/blocs/memory_songs/memory_songs_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInjector.inject();

  runApp(const MusicSaverApp());
}

class MusicSaverApp extends StatelessWidget {
  const MusicSaverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SongsBloc(songsRepo: AppInjector.songsRepo)),
        BlocProvider(create: (_) => FilesystemSongsBloc(songsRepo: AppInjector.songsRepo)),
        BlocProvider(create: (_) => MemorySongsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music saver',
        theme: AppTheme.data,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
