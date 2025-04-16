import 'package:flutter/material.dart';
import 'package:rm_systems_mobile/configs/factory_viewmodel.dart';
import 'package:rm_systems_mobile/ui/login/view_models/login_factory_viewmodel.dart';
import 'package:rm_systems_mobile/ui/profile/view_models/user_viewmodel.dart';

final class UserFactoryViewModel implements IFactoryViewModel<UserViewModel> {
  @override
  UserViewModel create(BuildContext context) {
    final IRemoteDataSource remoteDataSource = RemoteFactoryDataSource().create();
    final NonRelationalDataSource? nonRelationalDataSource = NonRelationalFactoryDataSource().create();
    return UserViewModel(remoteDataSource, nonRelationalDataSource as INonRelationalDataSource);
  }

  @override
  void dispose(BuildContext context, UserViewModel viewModel) {
    viewModel.close();
  }
}