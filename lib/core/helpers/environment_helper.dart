abstract interface class IEnvironmentHelper {
  String get urlBase;
  String get urlAuthentication;
  String get urlUserInformation;
  String get urlRooms;
  String get urlReservations;
}

final class EnvironmentHelper implements IEnvironmentHelper {
  const EnvironmentHelper();

  @override
  String get urlBase => 'https://127.0.0.1';

  @override
  String get urlAuthentication => '$urlBase/authentication';

  @override
  String get urlUserInformation => '$urlBase/user_information';

  @override
  String get urlRooms => '$urlBase/rooms';

  @override
  String get urlReservations => '$urlBase/reservations';
}