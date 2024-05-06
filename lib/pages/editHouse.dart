import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:house_and_job/components/verticalSpacing.dart';

import '../constants/color.dart';
import '../constants/fonts.dart';
class EditHouse extends StatefulWidget {
  const EditHouse({super.key});

  @override
  State<EditHouse> createState() => _EditHouseState();
}

class _EditHouseState extends State<EditHouse> {
  final List<Map<String, dynamic>> list = [
    {
      "title": "Guests",
      "value":"5"
    },
    {
      "title": "Beds",
      "value":"4"
    },
    {
      "title": "Bedrooms",
      "value":"3"
    },
    {
      "title": "Baths",
      "value":"7"
    },
  ];
  final List<Map<String, dynamic>> rule = [
    {
      "title": "Check In time",
      "value":"10:00AM"
    },
    {
      "title": "Check Out time",
      "value":"4:00PM"
    },
    {
      "title": "Maximum gusts",
      "value":"7"
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
      "value":"+251934678848"
    },
    {
      "icon": Icons.location_city,
      "title": "Address",
      "value":"Stanford"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.close),
            ),
            SizedBox(width: 60),
            Text(
              "Edit House",
              style: MyText.subhead(context)!.copyWith(
                color: MyColor.textColor2,
                fontSize: 16,
              ),
            ),
          ],
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
            padding: EdgeInsets.only(left: 15, right: 10),
            children: [
              VerticalSpacing(height: 10),
              Text("Edit title of the house", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
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
              Text("Edit description of the house ", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
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
                    hintText: 'This charming 3-bedroom, 2-bathroom house is available for rent in the highly sought. Situated on a quiet tree-lined street, this spacious home offers comfort, convenience, and a warm atmosphere.',
                    hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                  ),
                ),
              VerticalSpacing(height: 10),
              Text("Edit the  categories for the house", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
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
                      alignment: Alignment.centerLeft,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(
                          color: MyColor.borderColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(category[index]['title'], style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                          SizedBox(width: 5,),
                          Row(
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 4,),
                              Icon(Icons.close),
                            ]
                          )
                        ],
                      ),
                    );
                  },
                ),
              VerticalSpacing(height: 10),
              Text("Edit house information", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
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
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(list[index]['title'], style: TextStyle(fontSize: 14, color: MyColor.textColor1),),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 5),
                        TextField(
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
                              hintText: '${list[index]['value']}',
                              hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              VerticalSpacing(height: 10),
              Text("Edit house offer", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
              VerticalSpacing(height: 10),
              Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  runAlignment: WrapAlignment.start,
                  children: List.generate(offer.length, (index) {
                    return Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only( right: 105),
                      alignment: Alignment.centerLeft,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        border: Border.all(color: MyColor.borderColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            offer[index]['title'],
                            style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17),
                            maxLines: 3,
                          ),
                          SizedBox(width: 6),
                         Row(
                           children: [
                             Icon(Icons.edit),
                             SizedBox(width: 8),
                             Icon(Icons.close),
                           ],
                         )
                        ],
                      ),
                    );
                  }),
                ),
              VerticalSpacing(height: 10),
              Text("Edit your contact information", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
              VerticalSpacing(height: 10),
              MasonryGridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: contact.length,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 4,
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(contact[index]['title'], style: TextStyle(fontSize: 14, color: MyColor.textColor1),),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 5),
                        TextField(
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
                              hintText: '${contact[index]['value']}',
                              hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              VerticalSpacing(height: 10),
              Text("Edit House rules", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
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
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(rule[index]['title'], style: TextStyle(fontSize: 14, color: MyColor.textColor1),),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 5),
                        TextField(
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
                              hintText: '${rule[index]['value']}',
                              hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              VerticalSpacing(height: 10),
              Text("Edit price per night", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
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
                    hintText: '\200',
                    hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                  ),
                ),
              VerticalSpacing(height: 10),
              Text("Edit time duration", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
              VerticalSpacing(height: 10),
              Column(
                children: [
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                         Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Start Date", style: TextStyle(fontSize: 14, color: MyColor.textColor1),),
                          ],
                      ),
                      VerticalSpacing(height: 5),
                      Container(
                        // width: MediaQuery.of(context).size.width/2-10,
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
                              hintText: '4/1/2024:2:00AM',
                              hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                            ),
                          ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("End Date", style: TextStyle(fontSize: 14, color: MyColor.textColor1),),
                          ],
                      ),
                      VerticalSpacing(height: 5),
                      Container(
                            child:  TextField(
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
                              hintText: '5/1/2024:2:00AM',
                              hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                            ),
                          ),
                      ),
                    ],
                  ),
                ],
              ),
              VerticalSpacing(height: 10),
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
                    child: Text('Update',style: MyText.subhead(context)!
                        .copyWith(color: Colors.white)),
                  ),
                ),
              VerticalSpacing(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}
