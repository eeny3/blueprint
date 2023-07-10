extension StringExtension on String {
  String substringSafety(int start, [int? end]) {
    end ??= length;

    if (end > length) {
      end = length;
    }

    return substring(start, end);
  }

  /// str -> Str
  String toFirstLetterUpperCase() {
    if (this.isEmpty) {
      return this;
    } else if (this.length == 1) {
      return toUpperCase();
    }

    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// first_second -> firstSecond
  String transformToCamelCase() {
    final list = split('_');

    if (list.isEmpty || list.length == 1) {
      return this;
    }

    final buffer = StringBuffer();

    buffer.write(list[0]);

    for (int i = 1; i < list.length; i++) {
      buffer.write(list[i].toFirstLetterUpperCase());
    }

    return buffer.toString();
  }
}
