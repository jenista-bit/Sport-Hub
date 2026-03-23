// main.dart (ปรับเต็ม)
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:future_hub/core/themes/app_theme.dart';
import 'package:future_hub/feature/controller/app_controller.dart';
import 'package:future_hub/route/app_page.dart';
import 'package:future_hub/route/app_route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BrandHub',
          theme: getAppTheme(),
          initialRoute: AppRoutes.splash,
          getPages: AppPages.pages,
          initialBinding: BindingsBuilder(() {
            Get.put(AppController());
          }),
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // สำหรับ Web: ขยายเต็มจอจริง ๆ (designSize = ขนาดจอจริง)
                  if (kIsWeb) {
                    ScreenUtil.init(
                      context,
                      designSize: Size(constraints.maxWidth, constraints.maxHeight),
                      minTextAdapt: true,
                    );
                    return child!;
                  }
                  return child!;
                },
              ),
            );
          },
        );
      },
    );
  }
}