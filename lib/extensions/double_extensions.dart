extension DoubleExtension on double {
  String toStringAsNum([int fractionDigits = 1]) {
    final isInteger = truncateToDouble() == this;

    return toStringAsFixed(isInteger ? 0 : fractionDigits);
  }
}
