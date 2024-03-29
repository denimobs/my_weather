extension StringX on String {
  bool get isEmail {
    final regex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return regex.hasMatch(this);
  }
}
