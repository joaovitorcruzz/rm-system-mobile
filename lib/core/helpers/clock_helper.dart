abstract interface class IClockHelper {
  DateTime get currentDateTime;
}

final class ClockHelper implements IClockHelper {
  const ClockHelper();

  @override
  DateTime get currentDateTime => DateTime.now();
}