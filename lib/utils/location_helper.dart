import 'package:app_settings/app_settings.dart';
import 'package:geolocator/geolocator.dart';

import '../widgets/constant_widgets.dart';



Future<Position?> getCurrentLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    showCustomAlertDialog(
        title: 'Location Service',
        content: 'Location service is necessary to get location',
        confirm: "Enable",
        isDismissable: false,
        onTabConfirm: () {
          AppSettings.openLocationSettings();
        });
    return null;
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      showCustomAlertDialog(
          title: 'Permission Required',
          content: 'Location permission is required for on boarding with us',
          confirm: "Allow",
          onTabConfirm: () {
            AppSettings.openAppSettings();
          });
      return null;
    }
  }

  if (permission == LocationPermission.deniedForever) {
    showCustomAlertDialog(
        title: 'Permission Required',
        content: 'Location permission is required for on boarding with us',
        confirm: "Allow",
        onTabConfirm: () {
          AppSettings.openAppSettings();
        });
    return null;
  }

  return await Geolocator.getCurrentPosition();
}
