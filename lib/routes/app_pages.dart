import 'package:get/get.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/screens/common/facility_screen/facility_screen.dart';
import 'package:icm/screens/common/meter_screen/meter_screen.dart';
import 'package:icm/screens/common/reading_screen/reading_screen.dart';
import 'package:icm/screens/common/service_screen/service_screen.dart';
import 'package:icm/screens/home/home_screen.dart';
import 'package:icm/screens/login/login_screen.dart';
import 'package:icm/screens/onBoarding/on_boarding.dart';
import 'package:icm/screens/qrscan/qrscan_screen.dart';
import 'package:icm/screens/tenant/tenant_screen.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.onBoardingScreen, page: () => const OnBoarding()),
    GetPage(name: AppRoutes.logInScreen, page: () => LogInScreen()),
    GetPage(name: AppRoutes.homeScreen, page: () => HomeScreen()),
    GetPage(name: AppRoutes.facilityScreen, page: () => FacilityScreen()),
    GetPage(name: AppRoutes.tenantScreen, page: () => TenantScreen()),
    GetPage(name: AppRoutes.serviceScreen, page: () => ServiceScreen()),
    GetPage(name: AppRoutes.meterScreen, page: () => MeterScreen()),
    GetPage(name: AppRoutes.readingScreen, page: () => ReadingScreen()),
    GetPage(name: AppRoutes.qrScanScreen, page: () => QRScanScreen()),


  ];
}
