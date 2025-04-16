import 'package:rm_systems_mobile/domain/enum/app_state_enum.dart';

abstract class IRequestState<T> {
  AppStateEnum get state;
  T? get dataOrNull;
  Object? get errorOrNull;
}

class RequestInitiationState<T> implements IRequestState<T> {
  @override
  AppStateEnum get state => AppStateEnum.none;

  @override
  T? get dataOrNull => null;

  @override
  Object? get errorOrNull => null;

  const RequestInitiationState();
}

class RequestProcessingState<T> implements IRequestState<T> {
  @override
  AppStateEnum get state => AppStateEnum.processing;

  @override
  T? get dataOrNull => null;

  @override
  Object? get errorOrNull => null;

  const RequestProcessingState();
}

class RequestCompletedState<T> implements IRequestState<T> {
  final T value;

  @override
  AppStateEnum get state => AppStateEnum.completed;

  @override
  T? get dataOrNull => value;

  @override
  Object? get errorOrNull => null;

  const RequestCompletedState({required this.value});
}

class RequestErrorState<T> implements IRequestState<T> {
  final Object error;

  @override
  AppStateEnum get state => AppStateEnum.error;

  @override
  T? get dataOrNull => null;

  @override
  Object? get errorOrNull => error;

  const RequestErrorState({required this.error});
}