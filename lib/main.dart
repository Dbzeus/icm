import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:icm/routes/app_pages.dart';
import 'package:icm/routes/app_routes.dart';
import 'package:icm/utils/custom_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icm/utils/notification.dart';
import 'package:icm/utils/session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //check session
  await GetStorage.init();
  await FirebaseNotifcation().initialize();

  final box = GetStorage();

  String initialRoute = AppRoutes.onBoardingScreen;
  if (box.read(Session.isLogin) ?? false) {
    initialRoute = AppRoutes.homeScreen;
  }

  runApp(MyApp(initialRoute));
}

class MyApp extends StatelessWidget {
  String initialRoute;


  MyApp(
    this.initialRoute, {
    Key? key,
  }) : super(key: key);

  static Alice alice = Alice(
    showNotification: true,
    showInspectorOnShake: true,

  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ICM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        primaryColor: primaryColor,
        primarySwatch: const MaterialColor(
          0xFF000000,
          <int, Color>{
            50: Color.fromRGBO(38, 38, 38, 0.1), //10%
            100: Color.fromRGBO(38, 38, 38, 0.2), //20%
            200: Color.fromRGBO(38, 38, 38, 0.3), //30%
            300: Color.fromRGBO(38, 38, 38, 0.4), //40%
            400: Color.fromRGBO(38, 38, 38, 0.5), //50%
            500: Color.fromRGBO(38, 38, 38, 0.6), //60%
            600: Color.fromRGBO(38, 38, 38, 0.7), //70%
            700: Color.fromRGBO(38, 38, 38, 0.8), //80%
            800: Color.fromRGBO(38, 38, 38, 0.9), //90%
            900: Color.fromRGBO(38, 38, 38, 1), //100%
          },
        ),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      navigatorKey: alice.getNavigatorKey(),
      initialRoute: initialRoute,
      getPages: AppPages.routes,
    );
  }
}
