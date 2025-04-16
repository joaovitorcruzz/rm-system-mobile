class HttpResponseEntity<T> {
  final int statusCode;
  final T? data;
  final String? errorMessage;

  HttpResponseEntity(Set<dynamic> set, {
    required this.statusCode,
    this.data,
    this.errorMessage,
  });
}