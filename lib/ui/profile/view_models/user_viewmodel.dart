import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rm_systems_mobile/configs/injection_container.dart';
import 'package:rm_systems_mobile/core/service/app_service.dart';
import 'package:rm_systems_mobile/core/widgets/show_dialog_widget.dart';
import 'package:rm_systems_mobile/data/datasources/core/data_source.dart';
import 'package:rm_systems_mobile/domain/entities/core/http_response_entity.dart';
import 'package:rm_systems_mobile/domain/entities/core/request_state_entity.dart';
import 'package:rm_systems_mobile/domain/entities/room/user_entity.dart';
import 'package:rm_systems_mobile/routing/route_generator.dart';

final class UserViewModel extends Cubit<IRequestState<UserEntity>> {
  final IRemoteDataSource _remoteDataSource;
  final INonRelationalDataSource _nonRelationalDataSource;

  UserViewModel(this._remoteDataSource, this._nonRelationalDataSource) : super(const RequestInitiationState()) {
    _loadUserInformationAsync();
  }

  void _loadUserInformationAsync() async {
    try {
      _emit(RequestProcessingState());
      final String urlUserInformation = _remoteDataSource.environment?.urlUserInformation ?? '';
      final HttpResponseEntity<Map<String, dynamic>> response = (await _remoteDataSource.get<Map<String, dynamic>>(urlUserInformation));
      final userData = response.data as Map<String, dynamic>;
      final userEntity = UserEntity.fromMap(userData);
      _emit(RequestCompletedState(value: userEntity));
    } catch (error) {
      _emit(RequestErrorState(error: error));
      showSnackBar(error.toString());
    }
  }

  void onLogout() async {
    await _nonRelationalDataSource.clear(true);
    getIt<IAppService>().navigateNamedReplacementTo(RouteGeneratorHelper.kLogin);
  }

  void _emit(IRequestState<UserEntity> state) {
    if (isClosed) return;
    emit(state);
  }
}

class INonRelationalDataSource {
  clear(bool bool) {}
}