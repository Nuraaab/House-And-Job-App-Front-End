import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:house_and_job/components/line.dart';
import 'package:house_and_job/components/verticalSpacing.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import '../constants/color.dart';
import '../constants/fonts.dart';
class PostHouse extends StatefulWidget {
  const PostHouse({super.key});

  @override
  State<PostHouse> createState() => _PostHouseState();
}

class _PostHouseState extends State<PostHouse> {
  final List<Map<String, dynamic>> list = [
    {
      "title": "Guests",
    },
    {
      "title": "Beds",
    },
    {
      "title": "Bedrooms",
    },
    {
      "title": "Baths",
    },
  ];
  final List<Map<String, dynamic>> rule = [
    {
      "title": "Check In time",
    },
    {
      "title": "Check Out time",
    },
    {
      "title": "Maximum gusts",
    },
  ];
  final List<Map<String, dynamic>> category = [
    {
      "title": "Townhouse",
    },
    {
      "title": "Condos",
    },
    {
      "title": "Studios",
    },
    {
      "title": "Vilas",
    },
    {
      "title": "Appartment",
    },
  ];
  final List<Map<String, dynamic>> offer = [
    {
      "title": "Outdoor Space",
    },
    {
      "title": "Parking",
    },
    {
      "title": "Transportation",
    },
    {
      "title": "Facilities",
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
  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageList = [];
  bool imageSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: Text(
          "Post House",
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
          //       "Post house",
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
              padding: EdgeInsets.only(left: 15, right: 10),
              children: [
                VerticalSpacing(height: 10),
               GestureDetector(
                    onTap: () async {
                      setState(() {
                        imageSelected = true;
                        imageList =[];
                      });
                      final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
                      if (selectedImages != null && selectedImages.isNotEmpty) {
                        imageList.addAll(selectedImages);
                        setState(() {
                          imageSelected = false;
                        });
                      }
                      print(selectedImages![0].path);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left:3, right: 3, top: 10, bottom: 10),
                      margin: EdgeInsets.only( right: 36),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: MyColor.borderColor,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.cloud_upload, size: 70),
                          Text("Pick Image", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                          Text("You can select and pick multiple images", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 15), textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                ),
                imageList.isNotEmpty ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(
                            "${path.basename(imageList[0].path)} and ${imageList.length - 1} more",
                            maxLines: 10,
                          ),
                        ],
                      ),
                  ) : imageSelected ? Center(
                    child: Container(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(),
                                  ),
                  ): Text(""),
                VerticalSpacing(height: 10),
                Text("Add title for the house", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
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
                      hintText: 'House Title',
                      hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                    ),
                  ),
                VerticalSpacing(height: 10),
                Text("Add description for the house", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
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
                Text("Pick the  categories for the house", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                MasonryGridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: category.length,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4,
                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(5),
                        margin: EdgeInsets.only(right: 5),
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
                Text("Add house information", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                MasonryGridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list.length,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4,
                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            // prefixIcon:  Icon(list[index]['icon'] , color: MyColor.textColor1,),
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
                            hintText: '${list[index]['title']}',
                            hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                          ),
                      );
                    },
                ),
                VerticalSpacing(height: 10),
                Text("What this house offer", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                MasonryGridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: offer.length,
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
                            Text(offer[index]['title'], style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17))
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
                Text("Add House rules", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                MasonryGridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: rule.length,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 4,
                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            // prefixIcon:  Icon(list[index]['icon'] , color: MyColor.textColor1,),
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
                            hintText: '${rule[index]['title']}',
                            hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                          ),
                      );
                    },
                  ),
                VerticalSpacing(height: 10),
                Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                      SizedBox(width: 3,),
                      Text("Add More", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17))
                    ],
                  ),
                VerticalSpacing(height: 10),
                Text("Add price per night", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                      prefixIcon:  Icon(Icons.money_off_csred_outlined , color: MyColor.textColor1,),
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
                      hintText: 'Price per night',
                      hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                    ),
                  ),
                VerticalSpacing(height: 10),
                Text("Add time duration", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                VerticalSpacing(height: 10),
                Column(
                  children: [
                    Container(
                      child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon:  Icon(Icons.date_range_rounded , color: MyColor.textColor1,),
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
                            hintText: 'Start Date',
                            hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                          ),
                        ),
                    ),
                    VerticalSpacing(height: 10),
                    Container(
                      child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            prefixIcon:  Icon(Icons.date_range_rounded , color: MyColor.textColor1,),
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
                            hintText: 'Ende Date',
                            hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                          ),
                        ),
                      ),
                  ],
                ),
                VerticalSpacing(height: 20),
                Container(
                    width: double.maxFinite,
                    height: 50,
                    margin: const EdgeInsets.only(left: 5),
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
                VerticalSpacing(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
