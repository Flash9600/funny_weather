base class NetworkException implements Exception {  NetworkException({    required this.statusCode,    this.message,  });  final int statusCode;  final String? message;  @override  String toString() {    String result = 'NetworkException with status code: $statusCode.';    if (message != null) {      result += 'message:  $message';    }    return result;  }}