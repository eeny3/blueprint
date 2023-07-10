typedef CustomNameCallback<T> = T? Function(String? name);

extension EnumByNameOrNull<T extends Enum> on Iterable<T> {
  T? byNameOrNull(
    String? name, {
    CustomNameCallback? customNameCallback,
  }) {
    if (name == null) {
      return null;
    }

    try {
      return customNameCallback?.call(name) ?? byName(name);

      /// Обертка над byName подразумевает перехват исключения
      /// при отстуствии совпадений
      /// В эом случае выбрасывается ArgumentError extends Error
    } on Object catch (_) {
      return null;
    }
  }
}
