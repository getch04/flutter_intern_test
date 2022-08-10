import 'package:flutter_intern_test/app/common/storage/storage.dart';
import 'package:flutter_intern_test/app/data/api_helper.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends GetxController {
  final ApiHelper _apiHelper = ApiHelper.to;

  final RxList _dataList = RxList();
  List<dynamic> get dataList => _dataList;
  set dataList(List<dynamic> dataList) => _dataList.addAll(dataList);
  RxInt selectedIndex = 0.obs;


//rating
 Rx<double?> ratingValue=0.0.obs;

  @override
  void onReady() {
    super.onReady();
    // getPosts();
  }

  // void getPosts() {
  //   _apiHelper.getPosts().futureValue(
  //         (value) => dataList = value,
  //         retryFunction: getPosts,
  //         hasConnection: InternetConnectionChecker().hasConnection,
  //       );
  // }

  void onEditProfileClick() {
    Get.back();
  }

  void onFaqsClick() {
    Get.back();
  }

  void onLogoutClick() {
    Storage.clearStorage();
    // Get.offAllNamed(Routes.HOME);
    //Specify the INITIAL SCREEN you want to display to the user after logout
  }

  onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
