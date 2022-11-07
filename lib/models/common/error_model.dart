class ErrorModel {
  ErrorModel({
    required this.hasError,
    required this.errorType,
    required this.errorMessage,
  });

  bool hasError;
  String errorType;
  String errorMessage;
}
