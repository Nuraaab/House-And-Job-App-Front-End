import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:house_and_job/components/verticalSpacing.dart';
import '../constants/color.dart';
import '../constants/fonts.dart';
class EditJob extends StatefulWidget {
  const EditJob({super.key});

  @override
  State<EditJob> createState() => _EditJobState();
}

class _EditJobState extends State<EditJob> {

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
      "value":"+251945762390"
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
              "Edit Job",
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
            padding: const EdgeInsets.only(left: 15.0, right: 5),
            children: [
              Text("Edit Job Title", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
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
                  hintText: 'Graphic Design',
                  hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                ),
              ),
              VerticalSpacing(height: 10),
              Text("Edit Job Description", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
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
                  hintText: 'We are seeking a talented and creative Graphic Designer to join our team. As a Graphic Designer, you will be responsible for creating visually appealing designs that effectively communicate our brand message. You will work closely with the marketing and communications team to develop concepts, design materials, and ensure brand consistency across various platforms.',
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
                    alignment: Alignment.centerLeft,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                        color: MyColor.borderColor,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(category[index]['title'], style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                          SizedBox(width: 8,),
                         Row(
                           children: [
                             Icon(Icons.edit),
                             SizedBox(width: 5,),
                             Icon(Icons.close),
                           ],
                         ),
                        ],
                      ),
                    ),
                  );
                },
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
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(contact[index]['title'], style: TextStyle(fontSize: 14, color: MyColor.textColor1),),
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
              Text("Edit Job Type", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
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
                    alignment: Alignment.centerLeft,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      border: Border.all(
                        color: MyColor.borderColor,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(type[index]['title'], style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                          SizedBox(width: 8,),
                          Row(
                            children: [
                              Icon(Icons.edit),
                              SizedBox(width: 5,),
                              Icon(Icons.close),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              VerticalSpacing(height: 10),
              Text("Edit Job Price", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
              VerticalSpacing(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price", style: TextStyle(fontSize: 14, color: MyColor.textColor1),),
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
                      hintText: '\$300',
                      hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                    ),
                  ),
                ],
              ),
              VerticalSpacing(height: 10),
              Text("Add Job DeadLine", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
              VerticalSpacing(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("DaedLine", style: TextStyle(fontSize: 14, color: MyColor.textColor1),),
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
                      hintText: '07/02/2024-11:00PM',
                      hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor1),
                    ),
                  ),
                ],
              ),
              VerticalSpacing(height: 10),
              Text("Edit Responsiblity", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
              VerticalSpacing(height: 10),
              Column(
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
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(width: 5,),
                        Flexible(
                          child: Text(
                            "Collaborate with cross-functional teams to define project goals, requirements, and constraints.",
                            style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),
                            maxLines: 10,
                          ),
                        ),
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                ],
              ),
              VerticalSpacing(height: 10),
              Text("Edit Qualifications", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
              VerticalSpacing(height: 10),
              Column(
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
                  ),
                  SizedBox(height: 5,),
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
                        Icon(Icons.edit),
                        SizedBox(width: 5,),
                        Icon(Icons.close),
                      ],
                    ),
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
