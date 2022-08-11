import 'package:flutter/material.dart';
import 'package:flutter_intern_test/app/common/values/app_colors.dart';
import 'package:flutter_intern_test/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CarouselWithDotsPage extends StatelessWidget {
  final controller = Get.put(HomeController());

  final List<String> imgList = [
    'assets/images/Group 8130.jpg',
    'assets/images/Group 8130.jpg',
    'assets/images/Group 8130.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 520,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MediaQuery.of(context).viewInsets.bottom == 0
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: PageView.builder(
                            itemCount: 3,
                            pageSnapping: true,
                            onPageChanged: (inex) {
                              controller.current.value = inex;
                            },
                            itemBuilder: (context, pagePosition) {
                              return Container(
                                margin: const EdgeInsets.all(20),
                                child: Image(
                                  image: AssetImage(
                                    imgList[pagePosition],
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              );
                            }),
                      )
                    : Text(''),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map((url) {
                    int index = imgList.indexOf(url);
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.current.value == index
                            ? AppColors.secondaryColors
                            : const Color.fromRGBO(0, 0, 0, 0.9),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    controller.screenState.value == 0
                        ? 'Enter Phone Number'
                        : 'Enter OTP',
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
                controller.screenState.value == 0
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 30),
                        child: TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                            filled: false,
                            hintText: "10 Digit Phone Number",
                            hintStyle: GoogleFonts.poppins(),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 25),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: Color(0xffd2137b), width: 3),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: Color(0xffd2137b), width: 3),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  color: Color(0xffd2137b), width: 3),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: PinCodeTextField(
                          appContext: Get.context!,
                          length: 6,
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
                          hapticFeedbackTypes: HapticFeedbackTypes.medium,
                          hintCharacter: '0',
                          hintStyle: TextStyle(
                              color: AppColors.kPrimaryColor.withOpacity(0.3)),
                          onChanged: (value) {
                            controller.otpPin.value = value;
                          },
                          cursorColor: Colors.grey.shade300,
                          showCursor: true,
                          keyboardType: TextInputType.number,
                          // scrollPadding: const EdgeInsets.only(bottom: 170),
                          pinTheme: PinTheme(
                              activeColor: Colors.pink,
                              selectedColor: Colors.blue,
                              inactiveColor: Colors.black12,
                              activeFillColor:
                                  AppColors.kPrimaryColor.withOpacity(0.1),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              errorBorderColor: Colors.red,
                              // fieldOuterPadding: const EdgeInsets.all(5),
                              fieldHeight: 50,
                              fieldWidth: 50,
                              // borderWidth: 2,
                              shape: PinCodeFieldShape.box),
                        ),
                      ),
                GestureDetector(
                  onTap: () {
                    if (controller.screenState.value == 0) {
                      controller.screenState.value = 1;
                    } else {}
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 24),
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 4),
                              blurRadius: 5.0)
                        ],
                        color: controller.screenState.value == 0
                            ? const Color(0xffd2137b)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'We have sent you a 6 digit verification code on ',
                        style: GoogleFonts.poppins(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      ),
                      TextSpan(
                        text: '\n+91 934404955',
                        style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 220,
                  width: 120,
                  // color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
