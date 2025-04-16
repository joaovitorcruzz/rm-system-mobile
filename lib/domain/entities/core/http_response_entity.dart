final class HttpResponseEntity<T> {
  final T? data;
  final int? statusCode;

  const HttpResponseEntity({this.data, this.statusCode});
}