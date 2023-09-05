import 'package:flutter/cupertino.dart';

enum StorageType {
  memory(title: 'Memory', icon: CupertinoIcons.archivebox),
  filesystem(title: 'Filesystem', icon: CupertinoIcons.cloud);

  final String title;
  final IconData icon;

  const StorageType({required this.title, required this.icon});
}
