import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:house_and_job/components/verticalSpacing.dart';
import 'package:house_and_job/constants/color.dart';
import 'package:house_and_job/constants/images.dart';
import 'package:house_and_job/pages/editHouse.dart';
import 'package:house_and_job/pages/houseDetail.dart';

import '../constants/fonts.dart';
class HouseTab extends StatefulWidget {
  const HouseTab({super.key});

  @override
  State<HouseTab> createState() => _HouseTabState();
}

class _HouseTabState extends State<HouseTab> {
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
  bool _isLoggedIn = false;
  final List<String> images = [
    'house1.png',
    'house1.png',
    'house1.png',
    'house1.png',
    'house1.png',
    'house1.png',
  ];
  int currentIndex = 0;
  @override
  void initState() {
    _getTheDistance();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return  GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => HouseDetail()));
              },
              child: SizedBox(
                  width: double.maxFinite,
                  child: Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            CarouselSlider(
                              items: images.map((url) {
                                return Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                                      child: Image.asset(Img.get(url), fit: BoxFit.cover, height: 320),
                                    ),
                                    !_isLoggedIn ?
                                    Positioned(
                                        top: 2,
                                        right: 2,
                                        child: PopupMenuButton<String>(
                                        iconColor: Colors.white,
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
                                            builder: (BuildContext context) => EditHouse(),
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
                                ): Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Icon(Icons.favorite_border, color: Colors.white,)),
                                    Positioned(
                                      bottom: 30,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: images.asMap().entries.map((entry) {
                                          int index = entry.key;
                                          return Container(
                                            width: index == currentIndex ? 10.0 : 8.0,
                                            height: index == currentIndex ? 10.0 : 8.0,
                                            margin: EdgeInsets.symmetric(horizontal: 2.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: index == currentIndex ? MyColor.primary : Colors.white, // Change dot color based on index
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                              options: CarouselOptions(
                                height: 320,
                                enlargeCenterPage: true,
                                autoPlay: false,
                                aspectRatio: MediaQuery.of(context).size.width / 320,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration: Duration(milliseconds: 800),
                                viewportFraction: 1.0,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                },
                              ),
                            ),
                            VerticalSpacing(height: 10),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Stanford, Virginia',
                                          style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ],
                                    ),
                                  ),
                                   Row(
                                    children: [
                                      Icon(Icons.star, color: MyColor.textColor2, size: 18),
                                      SizedBox(width: 2),
                                      Text('(4.5)',style:  MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Text(
                                '${_distance} miles away',
                                  style:  MyText.body1(context)!.copyWith(color: MyColor.textColor1,),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Text(
                                'Apr 3-5',
                                style:  MyText.body1(context)!.copyWith(color: MyColor.textColor1,),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Text(
                                    '\$1000',
                                    style:  MyText.body1(context)!.copyWith(color: MyColor.secondary,),
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                    'night',
                                    style:  MyText.body1(context)!.copyWith(color: MyColor.textColor1,),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
            );
          },
          separatorBuilder: (context, index) => Padding(padding: EdgeInsets.only(bottom: 5)),
          itemCount: 3
      ),
    );
  }
}
