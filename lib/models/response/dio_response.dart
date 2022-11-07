class DioResponse {
  DioResponse({
    required this.responseStr,
    required this.hasError,
    required this.errorMessage,
  });

  final String responseStr;
  final bool hasError;
  final String errorMessage;
}
