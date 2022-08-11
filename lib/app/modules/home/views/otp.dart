// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_intern_test/app/common/util/exports.dart';
// import 'package:flutter_intern_test/app/modules/home/bindings/home_binding.dart';
// import 'package:flutter_intern_test/app/modules/home/controllers/home_controller.dart';
// import 'package:get/get.dart';

// import 'package:intl_phone_number_input/intl_phone_number_input.dart';

// class Otp extends StatelessWidget {
//    Otp({Key? key}) : super(key: key);
//   final controller = Get.put(HomeController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: Colors.white,
//       body: SizedBox(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(
//           children: [
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.32,
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     topRight: Radius.circular(20),
//                   ),
//                 ),
//                 child: registrationBody(context),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget registrationBody(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(18.0),
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 24,
//           ),
//           const Text(
//             'Registration',
//             style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Text(
//             "Enter your phone number. we'll send you a verification "
//             "code so we know you're real",
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.bold,
//               color: Colors.black38,
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(
//             height: 28,
//           ),
//           Container(
//             padding: EdgeInsets.all(18),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               children: [
//                 Stack(
//                   children: [
//                     inputPhone(),
//                     Positioned(
//                       left: 80,
//                       top: 8,
//                       bottom: 8,
//                       child: Container(
//                         height: 30,
//                         width: 1,
//                         color: Colors.black.withOpacity(0.13),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 22,
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.7,
//             child: nextButton(),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget nextButton() {
//     return ElevatedButton(
//       onPressed: () {
//         controller.verifyPhoneNumber();
//       },
//       style: ButtonStyle(
//         foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
//         backgroundColor:
//             MaterialStateProperty.all<Color>(AppColors.kPrimaryColor),
//         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(24),
//           ),
//         ),
//       ),
//       child: const Padding(
//         padding: EdgeInsets.all(14),
//         child: Text(
//           'Next',
//           style: TextStyle(fontSize: 16),
//         ),
//       ),
//     );
//   }

//   Widget inputPhone() {
//     return InternationalPhoneNumberInput(
//       initialValue: PhoneNumber(isoCode: 'ET'),
//       onInputChanged: (PhoneNumber number) {
//         if (kDebugMode) {
//           print(number.phoneNumber);
//         }
//       },
//       onInputValidated: (bool value) {
//         if (kDebugMode) {
//           print(value);
//         }
//       },
//       selectorConfig: const SelectorConfig(
//         selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
//       ),
//       selectorTextStyle: const TextStyle(color: Colors.black),
//       formatInput: false,
//       maxLength: 9,
//       keyboardType: const TextInputType.numberWithOptions(
//         signed: true,
//         decimal: true,
//       ),
//       cursorColor: Colors.black,
//       inputDecoration: InputDecoration(
//         contentPadding: const EdgeInsets.only(bottom: 15),
//         border: InputBorder.none,
//         hintText: 'Phone Number',
//         filled: false,
//         hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
//       ),
//       onSaved: (PhoneNumber number) {
//         if (kDebugMode) {
//           print('On Saved: $number');
//         }
//       },
//     );
//   }
// }
