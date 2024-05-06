import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:house_and_job/constants/images.dart';
import 'package:house_and_job/pages/homeScreen.dart';
import 'package:page_transition/page_transition.dart';
class AnimatedSpalshScreen extends StatefulWidget {
  const AnimatedSpalshScreen({Key? key}) : super(key: key);
  @override
  State<AnimatedSpalshScreen> createState() => _AnimatedSpalshScreenState();
}
class _AnimatedSpalshScreenState extends State<AnimatedSpalshScreen> {
  @override
  void initState() {
    super.initState();
    // _setLanguage();
  }
  // void _setLanguage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('isEnglish', true);
  // }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSplashScreen(
          splash: SizedBox(
            height: 300,
            child:Image.asset(Img.get('splash.png'), fit: BoxFit.cover,),
          ),
          splashIconSize: 300,
          backgroundColor: Colors.white,
          duration: 3500,
          pageTransitionType: PageTransitionType.topToBottom,
          animationDuration: const Duration(seconds: 0),
          nextScreen: const HomeScreen()),
    );
  }
}
