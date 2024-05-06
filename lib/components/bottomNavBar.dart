import 'package:flutter/material.dart';
import 'package:house_and_job/constants/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/fonts.dart';
import '../services/service.dart';
class SubBottomNavBarContainer extends StatefulWidget {
  const SubBottomNavBarContainer({Key? key}) : super(key: key);

  @override
  State<SubBottomNavBarContainer> createState() => _SubBottomNavBarContainerState();
}

class _SubBottomNavBarContainerState extends State<SubBottomNavBarContainer> {
  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      unselectedItemColor: Colors.black54.withOpacity(0.5),
      selectedItemColor: MyColor.primary,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedFontSize: 0,
      selectedFontSize: 1,
      elevation: 20,
      type: BottomNavigationBarType.shifting,
      items:  <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          tooltip: 'Explore',
          label: 'Explore',
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search_rounded, size: 25),
              SizedBox(height: 3,),
              Text('Explore', style: MyText.body1(context)?.copyWith(
                color: MyColor.primary,
              ),),
            ],
          ),
        ),
        BottomNavigationBarItem(
          tooltip: 'Wishlist',
          label: 'Wishlist',
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite_border_outlined, size: 25),
              SizedBox(height: 3,),
              Text('Wishlist', style: MyText.body1(context)?.copyWith(
                color: MyColor.textColor2,
              ),),
            ],
          ),
        ),
        BottomNavigationBarItem(
          tooltip: 'Inbox',
          label: 'Inbox',
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.mail_outline_rounded, size: 25),
              SizedBox(height: 3,),
              Text('Inbox', style: MyText.body1(context)?.copyWith(
                color: MyColor.textColor2,
              ),),
            ],
          ),
        ),
        BottomNavigationBarItem(
          tooltip: 'Profile',
          label: 'Profile',
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.person_2_rounded, size: 25),
              SizedBox(height: 3,),
              Text('Profile', style: MyText.body1(context)?.copyWith(
                color: MyColor.textColor2,
              ),),
            ],
          ),
        ),
      ],
      currentIndex: 0,
      onTap: (index) async {
        Services.onItemTapped(context, index);
      },
    );
  }
}
