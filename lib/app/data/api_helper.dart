import 'package:get/get.dart';

export 'package:flutter_intern_test/app/common/util/extensions.dart';
export 'package:flutter_intern_test/app/common/util/utils.dart';

abstract class ApiHelper {
  static ApiHelper get to => Get.find();

  Future<Response> getPosts();
}
