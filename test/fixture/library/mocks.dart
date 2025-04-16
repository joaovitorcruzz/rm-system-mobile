import 'package:mockito/mockito.dart';
import 'package:rm_systems_mobile/configs/environment_helper.dart';
import 'package:rm_systems_mobile/data/datasources/core/data_source.dart';
import 'package:rm_systems_mobile/core/service/app_service.dart';
import 'package:rm_systems_mobile/core/service/clock_helper.dart';
import 'package:rm_systems_mobile/core/service/http_service.dart';
import 'package:rm_systems_mobile/core/service/storage_service.dart';
import 'package:rm_systems_mobile/data/datasources/core/i_relational_data_source.dart';
import 'package:rm_systems_mobile/ui/profile/view_models/user_viewmodel.dart';

export 'package:mockito/mockito.dart';

final class MockRelationalDataSource extends Mock implements IRelationalDataSource {}

final class MockEnvironment extends Mock implements IEnvironmentHelper {}

final class MockRemoteDataSource extends Mock implements IRemoteDataSource {}

final class MockNonRelationalDataSource extends Mock implements INonRelationalDataSource {}

final class MockHttpService extends Mock implements IHttpService {}

final class MockStorageService extends Mock implements IStorageService {}

final class MockAppService extends Mock implements IAppService {}

final class MockClockHelper extends Mock implements IClockHelper {}