extension DurationExtension on Duration {
  String tohhmmss() {
    final values = <String>[];

    final int minutes = inMinutes.remainder(60);
    final int seconds = inSeconds.remainder(60);

    if (inHours != 0) values.add('${inHours}h');
    if (minutes != 0) values.add('${minutes}m');
    if (seconds != 0) values.add('${seconds}s');

    return values.join(' ');
  }
}
