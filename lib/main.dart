import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'core/theme/app_theme.dart';
import 'data/source/local_source.dart';
import 'bindings/splash_bindings.dart';
import 'core/constants/constants.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

// flutter pub run flutter_launcher_icons:main
// flutter run -d windows --no-sound-null-safety
// flutter build apk --release --no-sound-null-safety
// flutter build apk --split-per-abi --no-sound-null-safety
// flutter build appbundle --release --no-sound-null-safety
// flutter pub run build_runner watch --delete-conflicting-outputs

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// local source
  await LocalSource.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_) => GetMaterialApp(
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget ?? const SizedBox(),
            );
          },
          navigatorKey: AppConstants.navigatorKey,
          title: "Red Book",
          theme: AppThemes.light,
          darkTheme: AppThemes.dark,
          debugShowCheckedModeBanner: false,
          initialBinding: SplashBindings(),
          initialRoute: AppRoutes.initial,
          getPages: AppPages.pages,
          defaultTransition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 100),
        ),
      ),
    );
  }
}
