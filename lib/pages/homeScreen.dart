import 'package:flutter/material.dart';
import 'package:house_and_job/components/houseTabBody.dart';
import 'package:house_and_job/components/jobTabBody.dart';
import 'package:house_and_job/pages/filterScreen.dart';
import '../components/bottomNavBar.dart';
import '../components/verticalSpacing.dart';
import '../constants/color.dart';
import '../constants/fonts.dart';
import '../constants/images.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Widget>  pages =[
    HouseTab(),
    JobTab(),
  ];
  int currentIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: Colors.white,
        toolbarHeight: 15
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 10),
        child: DefaultTabController(
          length: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(height: 10),
             Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  elevation: 4,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 55,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 1),
                          blurRadius: 14,
                        ),
                      ],
                      border: Border.all(
                        color: Color(0XFFA7BCC7),
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: TextFormField(
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: const Icon(Icons.search, color: MyColor.textColor2),
                        ),
                        suffixIcon: GestureDetector(
                          onTap: (){
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return FilterScreen();
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Image.asset(Img.get('filter.png'), fit: BoxFit.cover,height: 25, width: 25,),
                          ),
                        ),
                        suffixIconConstraints: const BoxConstraints(
                          maxHeight: 100,
                          minHeight: 25,
                          minWidth: 25,
                          maxWidth: 100,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(10),
                        hintText: 'What Do You Search For?',
                        hintMaxLines: 2,
                        hintStyle: const TextStyle(fontSize: 14, color: MyColor.textColor2),
                      ),
                    ),
                  ),
              ),
              TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                unselectedLabelColor: MyColor.textColor2,
                indicatorColor: MyColor.secondary,
                dividerColor: MyColor.textColor1,
                labelStyle: MyText.subtitle(context)!.copyWith(color: MyColor.secondary),
                splashBorderRadius: BorderRadius.all(Radius.circular(8)),
                onTap: (index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                tabs: const [
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 4),
                    icon: Icon(Icons.house_siding_outlined, size: 30,),
                    text: 'Houses',
                  ),
                  Tab(
                    iconMargin: EdgeInsets.only(bottom: 4),
                    icon: Icon(Icons.work_outline, size: 30,),
                    text: 'Jobs',
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    VerticalSpacing(height: 15),
                    pages[currentIndex],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SubBottomNavBarContainer(),
    );
  }
}
