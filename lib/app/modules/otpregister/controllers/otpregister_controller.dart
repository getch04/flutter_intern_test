import 'package:flutter_intern_test/app/modules/widgets/custom_snackbar_widget.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class OtpregisterController extends GetxController {
  RxInt screenState = 0.obs;
  RxString otpPin = " ".obs;
  RxString countryDial = "+251".obs;
  String verID = " ";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  ///new
  void showSnackBarText(String text) {
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text(text),
    //   ),
    // );
    Get.snackbar('title', text);
  }

  Future<void> verifyPhone(String number) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 20),
      verificationCompleted: (PhoneAuthCredential credential) {
        showSnackBarText("Auth Completed!");
      },
      verificationFailed: (FirebaseAuthException e) {
        showSnackBarText("Auth Failed!");
      },
      codeSent: (String verificationId, int? resendToken) {
        showSnackBarText("OTP Sent!");
        verID = verificationId;
        // setState(() {
        screenState.value = 1;
        // });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        showSnackBarText("Timeout!");
      },
    );
  }

  Future<void> verifyOTP() async {
    await FirebaseAuth.instance
        .signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verID,
        smsCode: otpPin.value,
      ),
    )
        .whenComplete(() {
      // Navigator.of(context).pushReplacement(
      //   MaterialPageRoute(
      //     builder: (context) => const HomeScreen(),
      //   ),
      // );
      CustomSnackBar.buildCustomSnackbar(title: 'title', msg: '');
    });
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
