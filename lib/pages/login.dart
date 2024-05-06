import 'package:flutter/material.dart';
import 'package:house_and_job/components/line.dart';
import 'package:house_and_job/components/verticalSpacing.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../constants/color.dart';
import '../constants/fonts.dart';
import '../constants/images.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(onPressed: () {
                Navigator.of(context).pop();
              },
                  icon:  Icon(Icons.close)),
              SizedBox(width: 60,),
              Text("Login Or Signup", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 16)),
            ],
          ),
        ),
        Line(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(left: 15, right: 10),
            children: [
              VerticalSpacing(height: 10),
              Container(
                  alignment: Alignment.centerLeft,
                  height: 170,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 1),
                        blurRadius: 14,
                      ),
                    ],
                    border: Border.all(
                      color: Color(0XFFA7BCC7),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        alignment: Alignment.centerLeft,
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Country/Region',
                              style: MyText.subhead(context)!.copyWith(color: MyColor.secondary, fontSize: 17),
                            ),
                            IntlPhoneField(
                              textAlignVertical: TextAlignVertical.center,
                              dropdownIconPosition: IconPosition.trailing,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10),
                              ),
                              initialCountryCode: 'ET',
                              onChanged: (phone) {
                                print(phone.completeNumber);
                              },
                            ),
                          ],
                        ),
                      ),
                      Line(),
                      Container(
                        alignment: Alignment.centerLeft,
                        height: 60,
                        child: TextFormField(
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(

                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'Phone Number',
                            hintMaxLines: 2,
                            hintStyle:  MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17),
                          ),
                        ),
                      ),

                    ],
                  ),
              ),
              VerticalSpacing(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("We will call or text to confirm your number", style:  MyText.body1(context)!.copyWith(color: MyColor.textColor2,), textAlign: TextAlign.start,),
                  ],
                ),
              VerticalSpacing(height: 10),
              Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), // Set the border radius
                    color: MyColor.primary, // Set the background color
                  ),
                  child: ElevatedButton(
                    onPressed: () async{

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.white,// Make the button background transparent
                      elevation: 0, // Remove button elevation
                    ),
                    child: Text('Continue',style: MyText.subhead(context)!
                        .copyWith(color: Colors.white)),
                  ),
              ),
              VerticalSpacing(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/2-40,
                      height: 1,
                      color: Colors.grey[400],
                    ),
                    SizedBox(width: 3,),
                    Text('Or',style: TextStyle(color: MyColor.textColor2),),
                    Container(
                      width: MediaQuery.of(context).size.width/2-20,
                      height: 1,
                      color: Colors.grey[400],
                    ),
                  ],
              ),
              VerticalSpacing(height: 10),
              Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                    border:  Border.all(
                      color: MyColor.textColor1,
                    ),
                    borderRadius: BorderRadius.circular(5), // Set the border radius
                    color: Colors.white, // Set the background color
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,// Make the button background transparent
                      elevation: 0, // Remove button elevation
                    ),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Image.asset(
                          Img.get('email.png'),
                          width: 30,
                          height: 30,
                        )
                        ),
                        SizedBox(width: 5,),
                        Text('Continue With Email',style: MyText.subtitle(context)!
                            .copyWith(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              VerticalSpacing(height: 10),
              Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                    border:  Border.all(
                      color: MyColor.textColor1,
                    ),
                    borderRadius: BorderRadius.circular(5), // Set the border radius
                    color: Colors.white, // Set the background color
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,// Make the button background transparent
                      elevation: 0, // Remove button elevation
                    ),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Image.asset(
                          Img.get('apple.png'),
                          width: 30,
                          height: 30,
                        )
                        ),
                        SizedBox(width: 5,),
                        Text('Continue With Apple',style: MyText.subtitle(context)!
                            .copyWith(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              VerticalSpacing(height: 10),
              Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                    border:  Border.all(
                      color: MyColor.textColor1,
                    ),
                    borderRadius: BorderRadius.circular(5), // Set the border radius
                    color: Colors.white, // Set the background color
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,// Make the button background transparent
                      elevation: 0, // Remove button elevation
                    ),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Image.asset(
                          Img.get('google.png'),
                          width: 30,
                          height: 30,
                        )
                        ),
                        SizedBox(width: 5,),
                        Text('Continue With Google',style: MyText.subtitle(context)!
                            .copyWith(color: Colors.black)),
                      ],
                    ),
                  ),
              ),
              VerticalSpacing(height: 10),
              Container(
                  width: double.maxFinite,
                  height: 60,
                  decoration: BoxDecoration(
                    border:  Border.all(
                      color: MyColor.textColor1,
                    ),
                    borderRadius: BorderRadius.circular(5), // Set the border radius
                    color: Colors.white, // Set the background color
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.black,// Make the button background transparent
                      elevation: 0, // Remove button elevation
                    ),
                    child: Row(
                      children: [
                        IconButton(onPressed: (){}, icon: Image.asset(
                          Img.get('facebook.png'),
                          width: 30,
                          height: 30,
                        )
                        ),
                        SizedBox(width: 5,),
                        Text('Continue With Facebook',style: MyText.subtitle(context)!
                            .copyWith(color: Colors.black)),
                      ],
                    ),
                  ),
              ),
              VerticalSpacing(height: 10),
            ],
          )
        ),
      ],
    );


  }
}
