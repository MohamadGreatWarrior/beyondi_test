typedef ByPredicate<T> = dynamic Function(T it);

extension ListX<T> on List<T> {
  List<T> distinctBy(ByPredicate<T> by) {
    final keys = <dynamic>{};
    return where((item) {
      final dynamic key = by(item);
      if (!keys.contains(key)) {
        keys.add(key);
        return true;
      } else {
        return false;
      }
    }).toList();
  }

  List<T> safeSublist(int start, [int? end]) {
    // ignore: parameter_assignments
    start = start.clamp(0, length);

    if (end != null) {
      end = end.clamp(0, length);
    }

    return sublist(start, end);
  }

  int replaceWhere(bool Function(T) test, T Function(T) replacement) {
    final index = indexWhere(test);
    if (index >= 0) {
      this[index] = replacement(this[index]);
    }
    return index;
  }

  bool containsType<E>() {
    return whereType<E>().isNotEmpty;
  }
}
