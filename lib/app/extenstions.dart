extension ListExtension<E> on List<E> {
  /// Works just like the built in [.map()] function, but includes an index.
  Iterable<T> mapWithIndex<T>(T Function(int index, E value) f) {
    return asMap().entries.map((entry) {
      final index = entry.key;
      final value = entry.value;

      return f(index, value);
    });
  }
}