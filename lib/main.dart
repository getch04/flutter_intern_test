import 'package:flutter/material.dart';
import 'package:flutter_intern_test/app/common/util/initializer.dart';
import 'package:flutter_intern_test/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/modules/widgets/base_widget.dart';

void main() {
  Initializer.init(() {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, __) => GetMaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        initialBinding: InitialBindings(),
        builder: (_, child) => BaseWidget(
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
