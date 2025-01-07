/// Custom exception class to handle exceptions in the app
class CustomException implements Exception {
  final String message;
  final int statusCode;
  final String url;

  CustomException({
    required this.message,
    required this.statusCode,
    this.url = '',
  });

  @override
  String toString() => message;
}
