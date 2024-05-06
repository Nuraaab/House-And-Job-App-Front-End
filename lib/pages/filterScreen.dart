import 'package:flutter/material.dart';
import 'package:house_and_job/components/horizontalSpacing.dart';
import 'package:house_and_job/components/line.dart';
import 'package:house_and_job/components/verticalSpacing.dart';

import '../constants/color.dart';
import '../constants/fonts.dart';
class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues values = RangeValues(1000, 10000);
  RangeValues locVal = RangeValues(30, 700);
  double locMin = 0;
  double LocMax = 700;
  double min = 0;
  double max = 10000;
  @override
  Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());
    RangeLabels locLabels = RangeLabels(locVal.start.toString(), locVal.end.toString());
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
            HorizontalSpacing(width: 60),
            Text(
              "Filter House",
              style: MyText.subhead(context)!.copyWith(
                color: MyColor.textColor2,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Line(),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(left: 15, right: 10),
            children: [
              VerticalSpacing(height: 10),
              Text("Filter by Price", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
              VerticalSpacing(height: 10),
              RangeSlider(
                min: min,
                max: max,
                activeColor: MyColor.primary,
                divisions: 1000,
                  labels: labels,
                  values: values,
                  onChanged: (newValues){
                    setState(() {
                      values=newValues;
                    });
                  }),
              VerticalSpacing(height: 10),
              Text("Filter by Location", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
              VerticalSpacing(height: 10),
              RangeSlider(
                  min: min,
                  max: max,
                  activeColor: MyColor.primary,
                  divisions: 1000,
                  labels: locLabels,
                  values: locVal,
                  onChanged: (newValues){
                    setState(() {
                      locVal=newValues;
                    });
                  }),
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
                    child: Text('Apply',style: MyText.subhead(context)!
                        .copyWith(color: Colors.white)),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
