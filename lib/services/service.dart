import 'package:flutter/material.dart';
import 'package:house_and_job/components/verifyPhone.dart';
import 'package:house_and_job/pages/editJob.dart';
import 'package:house_and_job/pages/filterScreen.dart';
import 'package:house_and_job/pages/homeScreen.dart';
import 'package:house_and_job/pages/login.dart';
import 'package:house_and_job/pages/postJob.dart';
import 'package:house_and_job/pages/profile.dart';

import '../pages/editHouse.dart';
import '../pages/postHouse.dart';
class Services {
  static void onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 3:
        showModalBottomSheet(
          isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),
          context: context,
          builder: (BuildContext context) => Profile(),
        );
        break;
      case 1:
        showModalBottomSheet(
          context: context,
          // isScrollControlled: true,
          useSafeArea: true,
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),
          builder: (BuildContext context) => FilterScreen(),
        );
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => VerifyPhone()));
        break;
      case 0:
        showModalBottomSheet(
          context: context,
          builder: (context) => LoginScreen(),
        );
        break;
    }
  }
}