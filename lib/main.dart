import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern_test/app/common/util/initializer.dart';
import 'package:flutter_intern_test/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'app/modules/widgets/base_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
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
        // home: Otp(),
        getPages: AppPages.routes,
        initialBinding: InitialBindings(),
        builder: (_, child) => BaseWidget(
          child: child ?? const SizedBox.shrink(),
        ),
      ),
    );
  }
}
