abstract interface class IEnvironmentHelper {
  String? get urlAuthentication;
  String? get urlUserInformation;
  String? get urlRooms; 
  String? get urlReservations; 
}

final class EnvironmentHelper implements IEnvironmentHelper {
  const EnvironmentHelper();

  String get _urlBase => 'https://127.0.0.1';

  @override
  String? get urlAuthentication => '$_urlBase/authentication';

  @override
  String? get urlUserInformation => '$_urlBase/user_information';

  @override
  String? get urlRooms => '$_urlBase/rooms';

  @override
  String? get urlReservations => '$_urlBase/reservations';
}