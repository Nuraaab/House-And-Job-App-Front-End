import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:house_and_job/components/horizontalSpacing.dart';
import 'package:house_and_job/components/line.dart';
import 'package:house_and_job/components/verticalSpacing.dart';
import 'package:house_and_job/constants/images.dart';
import 'package:house_and_job/pages/login.dart';
import 'package:house_and_job/pages/postHouse.dart';
import 'package:house_and_job/pages/postJob.dart';

import '../constants/color.dart';
import '../constants/fonts.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profile",
                style: MyText.subhead(context)!.copyWith(
                  color: MyColor.textColor2,
                  fontSize: 16,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.close),
              ),

            ],
          ),
        ),
        Card(
          color: Color(0XFFA7BCC7),
          elevation: 2,
          child: Container(
            width: double.maxFinite,
            height: 1,
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.only(left: 15.0, right: 10),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(Img.get('profile.png'), fit: BoxFit.cover, width: 60, height: 60,),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Jane", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                          SizedBox(height: 3,),
                          Text("Show Profile", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                ],
              ),
              VerticalSpacing(height:10),
              Line(),
              VerticalSpacing(height:20),
              GestureDetector(
                onTap: () {
                  // showModalBottomSheet(
                  //   isScrollControlled: true,
                  //   useSafeArea: true,
                  //   backgroundColor: Colors.white,
                  //   shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                  //   ),
                  //   context: context,
                  //   builder: (BuildContext context) => PostHouse(),
                  // );
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => PostHouse()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.upload),
                        HorizontalSpacing(width: 5),
                        Text(
                          "Post Houses",
                          style: MyText.body1(context)!.copyWith(
                            color: MyColor.textColor2,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                  ],
                ),
              ),
              Line(),
              VerticalSpacing(height:20),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    context: context,
                    builder: (BuildContext context) => PostJob(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.upload),
                        HorizontalSpacing(width: 5),
                        Text(
                          "Post Jobs",
                          style: MyText.body1(context)!.copyWith(
                            color: MyColor.textColor2,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                  ],
                ),
              ),
              Line(),
              VerticalSpacing(height:10),
              Text(
                "Settings",
                style: MyText.subhead(context)!.copyWith(
                  color: MyColor.secondary,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
              VerticalSpacing(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.person),
                      HorizontalSpacing(width: 5),
                      Text(
                        "Personal Information",
                        style: MyText.body1(context)!.copyWith(
                          color: MyColor.textColor2,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                ],
              ),
              Line(),
              VerticalSpacing(height:20),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    useSafeArea: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    context: context,
                    builder: (BuildContext context) => LoginScreen(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.login),
                        HorizontalSpacing(width: 5),
                        Text(
                          "Login And Security",
                          style: MyText.body1(context)!.copyWith(
                            color: MyColor.textColor2,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                  ],
                ),
              ),
              Line(),
              VerticalSpacing(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time),
                      HorizontalSpacing(width: 5),
                      Text(
                        "Accessiblity",
                        style: MyText.body1(context)!.copyWith(
                          color: MyColor.textColor2,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                ],
              ),
              Line(),
              VerticalSpacing(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.notification_important),
                      HorizontalSpacing(width: 5),
                      Text(
                        "Notification",
                        style: MyText.body1(context)!.copyWith(
                          color: MyColor.textColor2,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                ],
              ),
              Line(),
              VerticalSpacing(height:20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.privacy_tip_rounded),
                      HorizontalSpacing(width: 5),
                      Text(
                        "Privecy And Sharing",
                        style: MyText.body1(context)!.copyWith(
                          color: MyColor.textColor2,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios_rounded, size: 20,),
                ],
              ),
              Line(),
            ],
          ),
        ),
      ],
    );
  }
}
