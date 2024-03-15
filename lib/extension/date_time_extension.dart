extension ConvertToMinute on int {
  String timeToMinute() {
    int inMinute = this ~/ 60;
    return '$inMinute mins';
  }
}