import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/fonts.dart';
import '../constants/images.dart';
class Review extends StatefulWidget {
  const Review({super.key});

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 220,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    border: Border.all(
                      color: Color(0XFFA7BCC7),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: MyColor.secondary,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: MyColor.secondary,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: MyColor.secondary,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: MyColor.textColor1,
                              size: 15,
                            ),
                            Icon(
                              Icons.star,
                              color: MyColor.textColor1,
                              size: 15,
                            ),
                            SizedBox(width: 3,),
                            Text("-2 week ago", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17), maxLines: 3,),
                          ],
                        ),
                        SizedBox(height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Text("It is great to have you, we got the best conforts on your house", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 15), maxLines: 3,),
                        ),
                        SizedBox(height: 8,),
                        Padding(padding: EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: [
                              Image.asset(Img.get('profile.png'), height: 40, width: 40, fit: BoxFit.cover,),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Snow", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17), maxLines: 3,),
                                    SizedBox(height: 3,),
                                    Text("Joind 3 years ago", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 14), maxLines: 3,),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
