import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intern_test/app/common/storage/storage.dart';
import 'package:flutter_intern_test/app/data/api_helper.dart';
import 'package:flutter_intern_test/app/modules/home/views/pages/carousel_component.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // final ApiHelper _apiHelper = ApiHelper.to;

  final RxList _dataList = RxList();
  List<dynamic> get dataList => _dataList;
  set dataList(List<dynamic> dataList) => _dataList.addAll(dataList);
  RxInt selectedIndex = 0.obs;

//rating
  Rx<double?> ratingValue = 0.0.obs;

  ////points
  RxInt current = 0.obs;

  //FOR OTP PART
  RxString otpPin = " ".obs;
  RxString countryDial = "+251".obs;
  String verID = " ";
  RxInt screenState = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }
  // void getPosts() {
  //   _apiHelper.getPosts().futureValue(
  //         (value) => dataList = value,
  //         retryFunction: getPosts,
  //         hasConnection: InternetConnectionChecker().hasConnection,
  //       );
  // }

  open() {
    showModalBottomSheet<void>(
        context: Get.context!,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[CarouselWithDotsPage()],
              ),
            ),
          );
        });
  }

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

  FirebaseAuth auth = FirebaseAuth.instance;
  RxString phoneNumber = ''.obs;
  RxString verificationIdReceived = ''.obs;
  RxBool otpCodeVisible = false.obs;

  verifyPhoneNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: phoneNumber.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await auth.signInWithCredential(credential).then((value) {
          print('user verified successfully!');
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
        print(e.message);

        // Handle other errors
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = 'xxxx';
        verificationIdReceived.value = verificationId;
        otpCodeVisible.value = true;
        print(verificationId);
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: smsCode);

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        // Auto-resolution timed out...
      },
    );
  }

  verify() {
// PhoneAuthCredential credential = PhoneAuthProvider.getCredential(verificationId, code);  }
  }
}
