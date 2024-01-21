abstract class StringUtils {
  static String capitalize(String? s) {
    if (s == null || s.isEmpty) return s ?? '';
    return s[0].toUpperCase() + s.substring(1);
  }

  static String? capitalizeAll(String? s) {
    if (s == null || s.isEmpty) return s;
    return s.split(' ').map((e) => capitalize(e)).join(' ');
  }

  static String? capitalizeAllFirst(String? s) {
    if (s == null || s.isEmpty) return s;
    return s.split(' ').map((e) => capitalize(e)).join(' ');
  }

  static String? capitalizeAllFirstAndLast(String? s) {
    if (s == null || s.isEmpty) return s;
    return s.split(' ').map((e) => capitalize(e)).join(' ');
  }

  static String? capitalizeFirstAndLast(String? s) {
    if (s == null || s.isEmpty) return s;
    return s.split(' ').map((e) => capitalize(e)).join(' ');
  }

  static String orEmpty(String? str) => str ?? '';
}
