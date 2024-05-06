import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:house_and_job/components/line.dart';

import '../components/verticalSpacing.dart';
import '../constants/color.dart';
import '../constants/fonts.dart';
class PostJob extends StatefulWidget {
  const PostJob({super.key});

  @override
  State<PostJob> createState() => _PostJobState();
}

class _PostJobState extends State<PostJob> {

  final List<Map<String, dynamic>> category = [
    {
      "title": "Software Development",
    },
    {
      "title": "Sales",
    },
    {
      "title": "Accounting And Finance",
    },
    {
      "title": "Art And Design",
    },
  ];

  final List<Map<String, dynamic>> type = [
    {
      "title": "Contract",
    },
    {
      "title": "Monthly",
    },
  ];
  final List<Map<String, dynamic>> contact = [
    {
      "icon": Icons.call,
      "title": "Phone Number",
    },
    {
      "icon": Icons.location_city,
      "title": "Address",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          "Post Jobs",
          style: MyText.subhead(context)!
              .copyWith(color: MyColor.secondary),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: [
          //     IconButton(
          //       onPressed: () {
          //         Navigator.of(context).pop();
          //       },
          //       icon: Icon(Icons.close),
          //     ),
          //     SizedBox(width: 60),
          //     Text(
          //       "Post Job",
          //       style: MyText.subhead(context)!.copyWith(
          //         color: MyColor.textColor2,
          //         fontSize: 16,
          //       ),
          //     ),
          //   ],
          // ),
          Line(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(left: 15.0, right: 5),
              children: [
                VerticalSpacing(height: 10),
                Text("Add Job Title", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                SizedBox(height: 10,),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon:  Icon(Icons.subtitles , color: MyColor.textColor1,),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: MyColor.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: MyColor.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Job Title',
                    hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                  ),
                ),
                VerticalSpacing(height: 10),
                Text("Add Job Description", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                TextField(
                  minLines: 5,
                  maxLines: 100,
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: MyColor.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: MyColor.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Description(not more than 1000 words)',
                    hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                  ),
                ),
                VerticalSpacing(height: 10),
                Text("Pick Job Category", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                MasonryGridView.builder(
                  padding: EdgeInsets.only(right: 60),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: category.length,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: MyColor.borderColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(category[index]['icon']),
                          // SizedBox(width: 4,),
                          Text(category[index]['title'], style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17))
                        ],
                      ),
                    );
                  },
                ),
                VerticalSpacing(height: 10),
                Text("Add your contact information", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                MasonryGridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: contact.length,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4,
                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon:  Icon(contact[index]['icon'] , color: MyColor.textColor1,),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: MyColor.borderColor,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: MyColor.borderColor,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            hintText: '${contact[index]['title']}',
                            hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                          ),
                      );
                    },
                  ),
                VerticalSpacing(height: 10),
                Text("Pick Job Type", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                MasonryGridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: type.length,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: MyColor.borderColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(type[index]['title'], style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17))
                        ],
                      ),
                    );
                  },
                ),
                VerticalSpacing(height: 10),
                Text("Add Job Price", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon:  Icon(Icons.monetization_on , color: MyColor.textColor1,),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: MyColor.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: MyColor.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'Price',
                    hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                  ),
                ),
                VerticalSpacing(height: 10),
                Text("Add Job DeadLine", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    prefixIcon:  Icon(Icons.date_range , color: MyColor.textColor1,),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: MyColor.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: MyColor.borderColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.all(10),
                    hintText: 'DaedLine',
                    hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                  ),
                ),
                VerticalSpacing(height: 10),
                Text("Please add  description of the key responsibilities and tasks expected for this role. This may include collaborating with teams, conducting research, creating design concepts, refining prototypes based on feedback, and ensuring the implementation of user-centric interfaces.", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(left: 25, right: 25),
                  alignment: Alignment.centerLeft,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: MyColor.borderColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 4,),
                      Text("Add Responsiblity", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17))
                    ],
                  ),
                ),
                VerticalSpacing(height: 10),
                Text("Please add the qualifications and skills required for this position. This may include educational background, relevant experience, proficiency in design tools, understanding of design principles, research and testing capabilities, communication skills, and technical competencies.", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(left: 25, right: 25),
                  alignment: Alignment.centerLeft,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(
                      color: MyColor.borderColor,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 4,),
                      Text("Add Qualification", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17))
                    ],
                  ),
                ),
                VerticalSpacing(height: 20),
                Container(
                  width: double.maxFinite,
                  height: 50,
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
                    child: Text('Post',style: MyText.subhead(context)!
                        .copyWith(color: Colors.white)),
                  ),
                ),
                VerticalSpacing(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
