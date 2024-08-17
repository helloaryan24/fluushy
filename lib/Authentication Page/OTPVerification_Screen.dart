import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../All_Custom_Faction/All_Widget.dart';
import '../All_Custom_Faction/Colors.dart';
import '../All_Custom_Faction/Image.dart';
import '../All_Custom_Faction/TextStyle.dart';
import '../Controller/OTPVerificationController.dart';

class OtpverificationScreen extends StatelessWidget {
  final Otpverificationcontroller controller =
      Get.put(Otpverificationcontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whitecolor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(Images.otplogo),
                ),
                SizedBox(height: 40),
                Text(
                  "OTP Verification",
                  style: TextStyles.Montserratbold6,
                ),
                SizedBox(height: 10),
                Text(
                  'Enter the OTP sent to example@gmail.com',
                  style: TextStyles.MontserratRegular2,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 80),
                PinCodeTextField(
                  controller: controller.mpinController,
                  appContext: context,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6), // Set to 6
                  ],
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderWidth: 2,
                    activeFillColor: Colors.white,
                    disabledColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: AppColors.gradientcolor2,
                    selectedColor: AppColors.gradientcolor1,
                    errorBorderColor: Colors.red,
                    inactiveFillColor: Colors.white,
                    inactiveColor: AppColors.contcolor1,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 40,
                    fieldOuterPadding:
                        const EdgeInsets.symmetric(horizontal: 5),
                  ),
                  autoFocus: false,
                  keyboardType: TextInputType.number,
                  length: 4,
                  // Set to 6
                  onChanged: controller.onPinChanged,
                  onSubmitted: (userInput) {},
                  cursorColor: Colors.transparent,
                  textStyle: TextStyle(
                    fontSize: 20,
                    height: 1.6,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.transparent,
                  mainAxisAlignment: MainAxisAlignment.center,
                  readOnly: false,
                  obscureText: false,
                ),
                SizedBox(height: 20),
                GestureDetector(onTap: (){
                  controller.resendotp(context);

                },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Didn’t you receive the OTP? ",
                        style: TextStyles.MontserratRegular2,
                      ),
                      Text(
                        " Resend OTP",
                        style: TextStyles.MontserratMedium6,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                CustomButton5(
                  style: TextStyles.Montserratbold1,
                  backgroundColor: AppColors.contcolor1,
                  onTap: () {
                    controller.Verifyotp(context);
                  },
                  text: "Verify",
                ),
                SizedBox(height: 20), // Adding some space at the bottom
              ],
            ),
          ),
        ),
      ),
    );
  }
}
