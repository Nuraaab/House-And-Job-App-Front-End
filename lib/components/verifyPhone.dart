import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:house_and_job/components/verticalSpacing.dart';

import '../constants/color.dart';
import '../constants/fonts.dart';
class VerifyPhone extends StatefulWidget {
  const VerifyPhone({super.key});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  bool hasError = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: MyColor.textColor2,
                width: 1.0,
              ),
            ),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded, size: 20,),
                ),
                SizedBox(width: 10),
                Text(
                  "Confirm phone number",
                  style: MyText.subhead(context)!
                      .copyWith(color: MyColor.secondary),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(height: 10),
              Text("Enter the code we’ve sent via SMS to +251925881508:",style:  MyText.subhead(context)!.copyWith(color: MyColor.textColor2), maxLines: 3,),
              VerticalSpacing(height: 10),
              OtpTextField(
                  numberOfFields: 5,
                  borderColor: MyColor.primary,
                  enabledBorderColor: MyColor.textColor2,
                  focusedBorderColor: MyColor.primary,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {

                  },
                  onSubmit: (String verificationCode){
                    showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        }
                    );
                  }, // end onSubmit
                ),
              VerticalSpacing(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Haven’t recieved a code?  More options", style:  MyText.subhead(context)!.copyWith(color: MyColor.textColor2), maxLines: 3,),
                  ],
                ),
              VerticalSpacing(height: 10),
              // Container(
              //     width: double.maxFinite,
              //     height: 60,
              //     margin: const EdgeInsets.only(left: 5),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(5),
              //       color: hasError ? Colors.grey : MyColor.primary,
              //     ),
              //     child: ElevatedButton(
              //       onPressed: () async{
              //
              //       },
              //       style: ElevatedButton.styleFrom(
              //         backgroundColor: Colors.transparent,
              //         foregroundColor: Colors.white,
              //         elevation: 0,
              //       ),
              //       child: Text('Continue',style: MyText.subhead(context)!
              //           .copyWith(color: Colors.white)),
              //     ),
              //   ),
              Text("Need Help?", style:  MyText.subhead(context)!.copyWith(color: MyColor.textColor2), maxLines: 3,),
            ],
          ),
        ),
      ),
    );
  }
}
