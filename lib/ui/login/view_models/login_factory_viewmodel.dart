import 'package:flutter/material.dart';
import 'package:rm_systems_mobile/configs/factory_viewmodel.dart';
import 'package:rm_systems_mobile/data/datasources/repositories/login/login_repository.dart';
import 'package:rm_systems_mobile/ui/login/view_models/login_viewmodel.dart';

final class LoginFactoryViewModel implements IFactoryViewModel<LoginViewModel> {
  @override
  LoginViewModel create(BuildContext context) {
    final IRemoteDataSource remoteDataSource = RemoteFactoryDataSource().create();
    final NonRelationalDataSource? nonRelationalDataSource = NonRelationalFactoryDataSource().create();
    final ILoginRepository loginRepository = LoginRepository(remoteDataSource, nonRelationalDataSource!);
    return LoginViewModel(loginRepository);
  }

  @override
  void dispose(BuildContext context, LoginViewModel viewModel) {
    viewModel.close();
  }
}

class NonRelationalFactoryDataSource {
  NonRelationalDataSource? create() {
    return null;
  }
}

