import 'package:flutter/material.dart';
import 'package:music_saver/animations/tap_animations/animated_color_tap.dart';
import 'package:music_saver/constants/theme/colors.dart';
import 'package:music_saver/constants/theme/text_styles.dart';
import 'package:music_saver/domain/models/ui/songs_storage.dart';
import 'package:music_saver/extensions/duration_extensions.dart';
import 'package:music_saver/features/storage/pages/storage_page.dart';

class StorageTile extends StatelessWidget {
  final SongsStorage _songsStorage;
  const StorageTile({required SongsStorage songsStorage, super.key}) : _songsStorage = songsStorage;

  @override
  Widget build(BuildContext context) {
    return AnimatedColorTap(
      padding: const EdgeInsets.fromLTRB(15, 18, 10, 18),
      onTap: () {
        Navigator.pushNamed(
          context,
          StorageSongsPage.route,
          arguments: _songsStorage.storageType,
        );
      },
      child: Row(
        children: [
          Icon(_songsStorage.storageType.icon, color: AppColors.black),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _songsStorage.storageType.title,
              style: AppTextStyles.black14w600,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            _songsStorage.getTotalDuration().tohhmmss(),
            style: AppTextStyles.grey600shade12w400,
          ),
          const SizedBox(width: 15),
          const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey),
        ],
      ),
    );
  }
}
