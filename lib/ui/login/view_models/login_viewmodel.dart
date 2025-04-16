import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rm_systems_mobile/configs/injection_container.dart';
import 'package:rm_systems_mobile/core/service/app_service.dart';
import 'package:rm_systems_mobile/core/widgets/show_dialog_widget.dart';
import 'package:rm_systems_mobile/data/datasources/repositories/login/login_repository.dart';
import 'package:rm_systems_mobile/domain/entities/core/request_state_entity.dart';
import 'package:rm_systems_mobile/domain/entities/login/login_entity.dart';
import 'package:rm_systems_mobile/routing/route_generator.dart';
import 'package:rm_systems_mobile/utils/util.validator.dart';
import 'package:rm_systems_mobile/utils/util_text.dart';


final class LoginViewModel extends Cubit<IRequestState<String>> {
  final ILoginRepository _repository;

  LoginViewModel(this._repository) : super(const RequestInitiationState());

  void onAuthentication(String login, String password) async {
    try {
      _emitter(RequestProcessingState());

      if (!UtilValidator.isValidEmail(login)) throw EmailInvalidException();
      if (!UtilValidator.isValidPassword(password)) throw PasswordInvalidException();

      final String token = await _repository.authenticationAsync(LoginEntity(login: login, password: password, email: ''));
      if (token.trim().isNotEmpty) _onNavigateGoHome();

      _emitter(RequestCompletedState(value: token));
    } catch (error) {
      final String errorDescription = _createErrorDescription(error);
      showSnackBar(errorDescription);
      _emitter(RequestErrorState(error: error));
    }
  }

  void _onNavigateGoHome() {
    getIt<IAppService>().navigateNamedReplacementTo(RouteGeneratorHelper.kHome);
  }

  String _createErrorDescription(Object? error) {
    if (error is EmailInvalidException) return UtilText.labelLoginInvalidEmail;
    if (error is PasswordInvalidException) return UtilText.labelLoginInvalidPassword;
    return UtilText.labelLoginFailure;
  }

  void _emitter(IRequestState<String> state) {
    if (isClosed) return;
    emit(state);
  }
}

class PasswordInvalidException {
}

class EmailInvalidException {
}