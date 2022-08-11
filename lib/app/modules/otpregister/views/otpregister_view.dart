import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_intern_test/app/modules/otpregister/controllers/otpregister_controller.dart';
import 'package:flutter_intern_test/app/modules/widgets/custom_button.dart';
import 'package:flutter_intern_test/app/common/util/exports.dart';
import 'package:flutter_intern_test/app/modules/widgets/custom_snackbar_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:logger/logger.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpregisterView extends StatelessWidget {
  OtpregisterView({Key? key}) : super(key: key);

  final controller = Get.put(OtpregisterController());

  TextEditingController usernameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  double screenHeight = 0;

  double screenWidth = 0;

  double bottom = 0;

  Color blue1 = const Color(0xff8cccff);

  Color blue = AppColors.kPrimaryColor;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    bottom = MediaQuery.of(context).viewInsets.bottom;

    return Obx(
      () => WillPopScope(
        onWillPop: () {
          controller.screenState.value = 0;

          return Future.value(false);
        },
        child: Scaffold(
          body: Container(
            height: screenHeight,
            width: screenWidth,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    tileMode: TileMode.decal,
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                  Color.fromARGB(255, 3, 248, 130),
                  AppColors.kPrimaryColor
                ])),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenHeight / 8),
                    child: Column(
                      children: [
                        Text(
                          "D4U RIDE",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth / 8,
                          ),
                        ),
                        Text(
                          controller.screenState.value == 2
                              ? "Recover Your Password"
                              : controller.screenState.value == 3
                                  ? 'Reset Password'
                                  : controller.screenState.value == 1
                                      ? 'Verify Your phone'
                                      : "Create an account today!",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: screenWidth / 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: circle(5),
                ),
                Transform.translate(
                  offset: const Offset(30, -30),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: circle(4.5),
                  ),
                ),
                Center(
                  child: circle(3),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    height: bottom > 0 ? screenHeight : screenHeight / 2,
                    width: screenWidth,
                    color: Colors.white,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth / 12,
                        right: screenWidth / 12,
                        top: bottom > 0 ? screenHeight / 12 : 0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller.screenState.value == 0
                              ? stateRegister()
                              : controller.screenState.value == 2
                                  ? stateForgotPass()
                                  : controller.screenState.value == 3
                                      ? stateLogin()
                                      : stateOTP(),
                          Container(
                            height: 50,
                            width: screenWidth,
                            margin: EdgeInsets.only(bottom: screenHeight / 12),
                            child: Center(
                              child: customeButton(
                                  onpress: () {
                                    // setState(() {
                                    Logger().d(controller.screenState.value);
                                    controller.screenState.value == 3
                                        ? CustomSnackBar.buildCustomSnackbar(
                                            title: 'Hey',
                                            msg:
                                                'this feature is under development')
                                        : controller.screenState.value = 1;
                                    // Logger().d(controller.screenState.value);
                                    // });
                                    //   if (controller.screenState.value == 0) {
                                    //     if (usernameController.text.isEmpty) {
                                    //       showSnackBarText(
                                    //           "Username is still empty!");
                                    //     } else if (phoneController.text.isEmpty) {
                                    //       showSnackBarText(
                                    //           "Phone number is still empty!");
                                    //     } else {
                                    //       controller.verifyPhone(
                                    //           controller.countryDial +
                                    //               phoneController.text);
                                    //     }
                                    //   } else {
                                    //     if (controller.otpPin.value.length >= 6) {
                                    //       controller.verifyOTP();
                                    //     } else {
                                    //       showSnackBarText(
                                    //           "Enter OTP correctly!");
                                    //     }
                                    //   }
                                  },
                                  title: controller.screenState.value == 3
                                      ? 'LOGIN'
                                      : controller.screenState.value == 1
                                          ? 'Verify'
                                          : 'CONTINUE'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
    // Get.snackbar('title', text);
  }

  Widget stateRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Username",
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: usernameController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              hintText: 'Type username here...',
              hintStyle: TextStyle(color: Colors.grey.shade500)),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          "Phone number",
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        IntlPhoneField(
          controller: phoneController,
          showCountryFlag: true,
          showDropdownIcon: true,
          initialValue: controller.countryDial.value,
          onCountryChanged: (country) {
            controller.countryDial.value = "+" + country.dialCode;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
          ),
        ),
        // SizedBox(
        //   height: bottom > 0 ? screenHeight : screenHeight * 0.07,
        // ),
        RichText(
          text: TextSpan(
            children: [
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    controller.screenState.value = 2;
                  },
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.montserrat(
                      color: Colors.black87,
                      fontSize: 12,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Already have an Account ?  ",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    controller.screenState.value = 3;
                  },
                  child: Text(
                    "Login",
                    style: GoogleFonts.montserrat(
                      color: AppColors.kPrimaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget stateForgotPass() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    "Enter the email associated with your account and we will send a link to reset your password",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Email",
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: usernameController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              hintText: 'Your Email here...',
              hintStyle: TextStyle(color: Colors.grey.shade500)),
        ),
      ],
    );
  }

  Widget stateLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Typing Your Phone Number And Password To Login",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Username",
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: usernameController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              hintText: 'Your username here...',
              hintStyle: TextStyle(color: Colors.grey.shade500)),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "passsword",
          style: GoogleFonts.montserrat(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          obscureText: true,
          controller: usernameController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              hintText: 'Your password here...',
              hintStyle: TextStyle(color: Colors.grey.shade500)),
        ),
      ],
    );
  }

  Widget stateOTP() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                text: "We just sent a code to ",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: controller.countryDial.value + phoneController.text,
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: "\nEnter the code here and we can continue!",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: PinCodeTextField(
            appContext: Get.context!,
            length: 4,
            // enableActiveFill: true,
            backgroundColor: Colors.white,

            animationDuration: const Duration(milliseconds: 500),
            animationType: AnimationType.scale,
            autoDismissKeyboard: true,
            blinkWhenObscuring: true,
            boxShadows: [
              BoxShadow(
                color: Colors.grey.shade100,
                offset: const Offset(
                  1.0,
                  1.0,
                ),
                blurRadius: 1.0,
                spreadRadius: 0.8,
              ),
            ],

            enablePinAutofill: true,
            hapticFeedbackTypes: HapticFeedbackTypes.light,
            hintCharacter: '0',
            hintStyle:
                TextStyle(color: AppColors.kPrimaryColor.withOpacity(0.3)),
            onChanged: (value) {
              // setState(() {
              controller.otpPin.value = value;
              // });
            },
            cursorColor: Colors.grey.shade300,
            showCursor: true,
            keyboardType: TextInputType.number,
            pinTheme: PinTheme(
                activeColor: blue,
                selectedColor: blue,
                inactiveColor: Colors.black12,
                activeFillColor: AppColors.kPrimaryColor.withOpacity(0.1),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                fieldHeight: 50,
                fieldWidth: 50,
                borderWidth: 3,
                shape: PinCodeFieldShape.circle),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Didn't receive the code? ",
                style: GoogleFonts.montserrat(
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    CustomSnackBar.buildCustomSnackbar(
                        title: 'Oh', msg: 'This feature is under developemt!');
                  },
                  child: Text(
                    "Resend",
                    style: GoogleFonts.montserrat(
                      color: Colors.black87,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget circle(double size) {
    return Container(
      height: screenHeight / size,
      width: screenHeight / size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
