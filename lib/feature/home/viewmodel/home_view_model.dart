class HomeViewModel {
  bool checkTime() {
    // true = light    false = dark
    final hour = DateTime.now().hour;
    if (6 <= hour && hour <= 18) {
      return true;
    }
    return false;
  }

  String readTimestamp(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return date.toString().substring(11, 16);
  }
}
