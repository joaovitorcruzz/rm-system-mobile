import 'dart:convert';
import 'package:rm_systems_mobile/data/datasources/core/data_source.dart';
import 'package:rm_systems_mobile/data/datasources/core/non_relational_datasource.dart';
import 'package:rm_systems_mobile/domain/entities/core/http_response_entity.dart';
import 'package:rm_systems_mobile/domain/entities/login/login_entity.dart';
import 'package:rm_systems_mobile/domain/error/login/login_exception.dart';
import 'package:rm_systems_mobile/core/library/extensions.dart';

abstract interface class ILoginRepository {
  Future<String> authenticationAsync(LoginEntity login);
}

final class LoginRepository implements ILoginRepository {
  final IRemoteDataSource _remoteDataSource;

  const LoginRepository(this._remoteDataSource, NonRelationalDataSource nonRelationalDataSource);

  @override
  Future<String> authenticationAsync(LoginEntity login) async {
    final HttpResponseEntity<String> httpResponse = await _remoteDataSource.post<String>(
      _remoteDataSource.urlAuthentication,
      jsonEncode(login.toMap()),
    );
    if (!httpResponse.toBool()) throw LoginNotFoundException();
    final String token = httpResponse.data as String;
    return token;
  }
}