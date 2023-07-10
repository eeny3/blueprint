extension MethodsList<E> on List<E> {
  E? removeAtOrNull(int? index) {
    if (index == null) {
      return null;
    }
    return removeAt(index);
  }
}
