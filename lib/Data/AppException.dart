class AppException implements Exception {
  String message = "";
  int code = 0;

  AppException({
    this.message = "",
    this.code = 0,
  });
}
