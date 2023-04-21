class NetworkException implements Exception {

  NetworkException({this.message = const {}});
  final Map<String, dynamic> message;
}