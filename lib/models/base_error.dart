mixin BaseError implements Error {
  late String message;
  String? exception;
  String? code;
  String? error;
  int? status;

  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}
