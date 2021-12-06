class StatusCode {
  static late int _statusCode;

  void setStatusCode(int statusCode) async {
    _statusCode = statusCode;
  }

  int getStatusCode() {
    return _statusCode;
  }
}