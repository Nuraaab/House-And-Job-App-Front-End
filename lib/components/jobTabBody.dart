import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_and_job/components/horizontalSpacing.dart';
import 'package:house_and_job/components/verticalSpacing.dart';
import 'package:house_and_job/constants/color.dart';
import 'package:house_and_job/pages/editJob.dart';
import 'package:house_and_job/pages/jobDetail.dart';

import '../constants/fonts.dart';
class JobTab extends StatefulWidget {
  const JobTab({super.key});

  @override
  State<JobTab> createState() => _JobTabState();
}

class _JobTabState extends State<JobTab> {
  bool _isBookMarked = false;
  bool _isLoggedIn = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => JobDetail()));
              },
              child:Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color:Color(0XFFA7BCC7),
                    )
                  ),
                  child:Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.work_outline, size: 70,),
                                  HorizontalSpacing(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Apple, New York',  style: MyText.body1(context)
                                              ?.copyWith(color: MyColor.textColor2, fontSize:16)),
                                          SizedBox(width: 10,),
                                        ],
                                      ),
                                      VerticalSpacing(height: 5),
                                      Text('UI/UX Designer',  style: MyText.medium(context)
                                          .copyWith(color: MyColor.secondary, fontSize:20)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('\$10K - \$15K / Month',  style: MyText.body1(context)
                                              ?.copyWith(color: MyColor.textColor2, fontSize:16)),
                                          VerticalSpacing(height: 5),
                                        ],
                                      ),
                                    ],
                                  ),

                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: _isLoggedIn ? IconButton(icon: Icon(_isBookMarked ? Icons.bookmark : Icons.bookmark_border, color: MyColor.secondary,), onPressed: () { setState(() {
                            _isBookMarked = !_isBookMarked;
                          }); },
                          ) : PopupMenuButton<String>(
                            iconColor: Colors.black,
                            elevation: 4,
                            onSelected: (value) {
                              if (value == 'edit') {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  useSafeArea: true,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
                                  ),
                                  context: context,
                                  builder: (BuildContext context) => EditJob(),
                                );
                              } else if (value == 'delete') {


                              }
                            },
                            itemBuilder: (BuildContext context) {
                              return [
                                PopupMenuItem<String>(
                                  height: 30,
                                  value: 'edit',
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit, size: 19,),
                                      SizedBox(width: 4,),
                                      Text('Edit',  style: MyText.subtitle(context)!
                                          .copyWith(color: Colors.black)),
                                    ],
                                  ),
                                ),
                                PopupMenuItem<String>(
                                  height: 30,
                                  value: 'delete',
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete, size: 19,),
                                      SizedBox(width: 4,),
                                      Text('Delete',  style: MyText.subtitle(context)!
                                          .copyWith(color: Colors.black)),
                                    ],
                                  ),
                                ),
                              ];
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
            );
          },
          separatorBuilder: (context, index) => Padding(padding: EdgeInsets.only(bottom: 5)),
          itemCount: 5
      ),
    );
  }
}
