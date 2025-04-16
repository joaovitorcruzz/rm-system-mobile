import 'package:flutter/material.dart';
export 'package:rm_systems_mobile/core/helpers/clock_helper.dart';
export 'package:rm_systems_mobile/core/helpers/environment_helper.dart';
export 'package:rm_systems_mobile/core/service/http_service.dart';
export 'package:rm_systems_mobile/data/datasources/core/data_source.dart';
export 'package:rm_systems_mobile/data/datasources/core/data_source_factory.dart';
export 'package:rm_systems_mobile/data/datasources/core/non_relational_datasource.dart';

abstract interface class IFactoryViewModel<T> {
  T create(BuildContext context);
  void dispose(BuildContext context, T viewModel);
}