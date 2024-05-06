import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/fonts.dart';
import '../constants/images.dart';
class WhereYouSleep extends StatefulWidget {
  const WhereYouSleep({super.key});

  @override
  State<WhereYouSleep> createState() => _WhereYouSleepState();
}

class _WhereYouSleepState extends State<WhereYouSleep> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 5.0), // Adjust spacing between items
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: Image.asset(
                        Img.get('house1.png'),
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Bedroom 1", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("1 queen bed", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 5), // Adjust spacing between items
        itemCount: 3,
      ),
    );
  }
}
