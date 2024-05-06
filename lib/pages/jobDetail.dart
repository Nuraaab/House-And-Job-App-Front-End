import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:house_and_job/components/line.dart';

import '../components/verticalSpacing.dart';
import '../constants/color.dart';
import '../constants/fonts.dart';
class JobDetail extends StatefulWidget {
  const JobDetail({super.key});

  @override
  State<JobDetail> createState() => _JobDetailState();
}

class _JobDetailState extends State<JobDetail> {
  Position? _currentUserPosition;
  double? distanceImMeter = 0.0;
  int _distance = 0;
  Future _getTheDistance() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    distanceImMeter = await Geolocator.distanceBetween(
      _currentUserPosition!.latitude,
      _currentUserPosition!.longitude,
      9.03136,
      38.74667,
    );
    var distance = distanceImMeter?.round().toInt();
    var distanceMile = (distance!/1609.34).round().toInt();
    setState(() {
      _distance = distanceMile;
    });
  }
  @override
  void initState() {
    _getTheDistance();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: Colors.white,
              ),
              child: IconButton(onPressed: () {Navigator.pop(context); }, icon: Icon(Icons.arrow_back_ios_new_outlined, size: 20,),)),
        ),
        title: Text(
          "Job Detail",
          style: MyText.subhead(context)!
              .copyWith(color: MyColor.secondary),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("UI/UX Designer", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17, fontWeight: FontWeight.bold)),
            Line(),
            VerticalSpacing(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Graphic design", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                    Text("Posted 2 hours ago", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                    Text("${_distance} Miles away", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                    Text("\$10 - \$15 / Month", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                    Text("Deadline 4/16/2024", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                    VerticalSpacing(height: 10),
                    Line(),
                    VerticalSpacing(height: 10),
                    Text("We are looking for a skilled UI/UX Designer who is passionate about creating seamless, user-centric experiences across web and mobile platforms. The ideal candidate will have a strong understanding of user psychology, interaction design principles, and industry best practices. From wireframing to prototyping and final implementation, you will play a crucial role in shaping the user journey and enhancing overall satisfaction.", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                    VerticalSpacing(height: 10),
                    Line(),
                    VerticalSpacing(height: 10),
                    Text("Responsibilities", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                    VerticalSpacing(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                              width: 0.8,                          // Adjust the border width as needed
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Collaborate with cross-functional teams to define project goals, requirements, and constraints.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Conduct user research, interviews, and usability testing to gather insights and validate design decisions.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Create wireframes, prototypes, and high-fidelity mockups to communicate design concepts and interactions.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Develop and maintain design systems, style guides, and UI component libraries to ensure consistency and scalability.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Iterate on designs based on feedback, user testing results, and analytics data.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Work closely with developers to ensure seamless translation of designs into functional interfaces.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Stay up-to-date with the latest UI/UX trends, technologies, and tools to continuously improve our design processes and deliverables.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    VerticalSpacing(height: 10),
                    Line(),
                    VerticalSpacing(height: 10),
                    Text("You need to have:", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                    VerticalSpacing(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Bachelor's degree in Design, HCI, Computer Science, or related field.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Proven experience as a UI/UX Designer or similar role, with a strong portfolio showcasing your design projects and process.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Proficiency in design and prototyping tools such as Adobe XD, Sketch, Figma, or similar.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Solid understanding of user-centered design principles, information architecture, and interaction design.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Experience conducting user research, usability testing, and synthesizing insights into actionable recommendations.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Strong communication and collaboration skills with the ability to effectively articulate and defend design decisions.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),  // Set your desired border color here
                                width: 0.8,                          // Adjust the border width as needed
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5.0))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 5,),
                              Flexible(
                                child: Text(
                                  "Knowledge of HTML, CSS, and JavaScript is a plus.",
                                  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                                  maxLines: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    VerticalSpacing(height: 10),
                    Line(),
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
            ),
          ],
        ),
      )
    );
  }
}
