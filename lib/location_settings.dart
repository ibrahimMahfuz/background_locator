import 'keys.dart';

class LocationAccuracy {
  const LocationAccuracy._internal(this.value);

  final int value;

  static const POWERSAVE = LocationAccuracy._internal(0);
  static const LOW = LocationAccuracy._internal(1);
  static const BALANCED = LocationAccuracy._internal(2);
  static const HIGH = LocationAccuracy._internal(3);
  static const NAVIGATION = LocationAccuracy._internal(4);
}

class LocationSettings {
  final LocationAccuracy accuracy;
  final int interval; //second
  final double distanceFilter;
  final String requestPermissionMsg;
  final String notificationTitle;
  final String notificationMsg;

  /// minute
  final int wakeLockTime;
  final bool autoStop;

  LocationSettings(
      {this.accuracy = LocationAccuracy.NAVIGATION,
      this.interval = 5,
      this.distanceFilter = 0,
      this.requestPermissionMsg =
          "'registerLocator' requires the ACCESS_FINE_LOCATION permission.",
      this.notificationTitle = 'Start Location Tracking',
      this.notificationMsg = 'Track location in background',
      this.wakeLockTime = 60, //minute
      this.autoStop = false});

  Map<String, dynamic> toMap() {
    return {
      Keys.ARG_ACCURACY: accuracy.value,
      Keys.ARG_INTERVAL: interval,
      Keys.ARG_DISTANCE_FILTER: distanceFilter,
      Keys.ARG_LOCATION_PERMISSION_MSG: requestPermissionMsg,
      Keys.ARG_NOTIFICATION_TITLE: notificationTitle,
      Keys.ARG_NOTIFICATION_MSG: notificationMsg,
      Keys.ARG_WAKE_LOCK_TIME: wakeLockTime,
      Keys.ARG_AUTO_STOP: autoStop,
    };
  }
}