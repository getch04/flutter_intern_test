import 'package:get/get.dart';

import '../controllers/otpregister_controller.dart';

class OtpregisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpregisterController>(
      () => OtpregisterController(),
    );
  }
}
