import 'package:rm_systems_mobile/core/service/http_service.dart';
import 'package:rm_systems_mobile/data/datasources/core/data_source.dart';
import 'package:rm_systems_mobile/data/datasources/core/remote_datasource.dart';
import 'package:rm_systems_mobile/core/service/http_service_factory.dart';


final class RemoteFactoryDataSource {
  IRemoteDataSource create() {
    final IHttpService httpService = HttpServiceFactory().create();
    return RemoteDataSource(httpService);
  }
}