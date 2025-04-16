import 'package:rm_systems_mobile/domain/entities/core/http_response_entity.dart';

extension HttpResponseExtension on HttpResponseEntity {
  bool toBool() {
    return (statusCode ?? 0) >= 200 && (statusCode ?? 0) <= 299;
  }
}