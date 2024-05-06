import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:house_and_job/components/line.dart';
import 'package:house_and_job/components/whereYouSleep.dart';
import 'package:house_and_job/constants/images.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:house_and_job/pages/housePics.dart';
import '../components/review.dart';
import '../components/verticalSpacing.dart';
import '../constants/color.dart';
import '../constants/fonts.dart';
class HouseDetail extends StatefulWidget {
  const HouseDetail({super.key});

  @override
  State<HouseDetail> createState() => _HouseDetailState();
}

class _HouseDetailState extends State<HouseDetail> {

  final List<String> images = [
    'house1.png',
    'house1.png',
    'house1.png',
    'house1.png',
    'house1.png',
    'house1.png',
  ];
  int currentIndex = 1;
  List<Marker> _marker = [];
  List<Marker> _list = [];
  Future<void> _getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    setState(() {
      _list = [
        Marker(
          markerId: MarkerId('1'),
          position: LatLng(position.latitude, position.longitude),
        ),
      ];
      center = LatLng(position.latitude, position.longitude);
    });
    print(position);
  }
  GoogleMapController? mapController;
  LatLng center = LatLng(0, 0);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState(){
    super.initState();
    _getLocation().then((_){
      _marker.addAll(_list);
      print("${_list}");
      print("${center}");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(onPressed: () {  }, icon: Icon(Icons.arrow_back, size: 25, color: Colors.white,),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.upload, size: 25, color: Colors.white,)),
          SizedBox(width: 10,),
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_outline_rounded, size: 25, color: Colors.white,)),
          SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
                items: images.map((url) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => HousePics(images: images,)));
                    },
                    child: Stack(
                      children: [
                        ClipRRect(
                          child: Image.asset(Img.get(url), fit: BoxFit.cover, height: 350),
                        ),
                        Positioned(
                          bottom: 10,
                            right: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                              height: 40,
                              width: 80,
                              child: Center(child: Text("${currentIndex} / ${images.length}", style: MyText.subhead(context)!
                                  .copyWith(color: Colors.white))),
                            )
                        ),
                      ],
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 320,
                  autoPlay: false,
                  aspectRatio: MediaQuery.of(context).size.width / 320,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 1.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index + 1;
                    });
                  },
                ),
            ),
            VerticalSpacing(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("New Appartment, 3 bed , Modern And safe.", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17), maxLines: 3,),
                      Text("Town house", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor1, fontSize: 16), maxLines: 3,),
                      Row(
                        children: [
                          Text("4 gusts -", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                          SizedBox(width: 3,),
                          Text("5 bedrooms -", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                          SizedBox(width: 3,),
                          Text("8 beds -", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                          SizedBox(width: 3,),
                          Text("4 baths", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, size: 20, color: MyColor.textColor2,),
                          SizedBox(width: 3,),
                          Text("4.67 -", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),),
                          SizedBox(width: 3,),
                          Text("20 reviews", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),),
                        ],
                      ),
                    ],
                  ),
                  VerticalSpacing(height: 10),
                  Line(),
                  VerticalSpacing(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(Img.get('work_history.png'), height: 70, width: 70,),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Less than 2 hour to book",  style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                            Text("The host will stop accept booking soon",  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16), maxLines: 2,
                              overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  VerticalSpacing(height: 10),
                  Line(),
                  VerticalSpacing(height: 10),
                  Row(
                    children: [
                      Image.asset(Img.get('profile.png'), height: 70, width: 70,),
                      SizedBox(width: 20,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rented By  Jane",  style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                          Row(
                            children: [
                              Text("Superhost -",  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                              SizedBox(width: 3,),
                              Text("1 year hosting",  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  VerticalSpacing(height: 10),
                  Line(),
                  VerticalSpacing(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(Img.get('location.png'), height: 70, width: 70,),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Great location",  style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17)),
                            Text("90% of gust gave a 5 star rating for this location",  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16), maxLines: 2,
                              overflow: TextOverflow.ellipsis,)
                          ],
                        ),
                      ),
                    ],
                  ),
                  VerticalSpacing(height: 10),
                  Line(),
                  VerticalSpacing(height: 10),
                  Text("Welcome to the Ocean Breeze Resort, where relaxation meets luxury! Our serene retreat nestled along the pristine coastline offers an escape like no other. Step into a world of tranquility where the rhythmic sounds of the ocean waves provide the perfect soundtrack to your stay.As you enter our grand lobby, adorned with elegant decor and soothing hues, you'll be greeted by our attentive staff who are dedicated to ensuring your every need is met.",  style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16),),
                  TextButton(onPressed: () {  },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Show More"),
                          SizedBox(width: 7,),
                          Icon(Icons.arrow_forward_ios_rounded, size: 17,),
                        ],
                      ),
                  ),
                  VerticalSpacing(height: 10),
                  Line(),
                  VerticalSpacing(height: 10),
                  Text("Where you’ll sleep", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17), maxLines: 3,),
                  VerticalSpacing(height: 10),
                  SizedBox(
                    height: 200,
                    child: WhereYouSleep(),
                  ),
                  VerticalSpacing(height: 10),
                  Line(),
                  VerticalSpacing(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("What this house offer ", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17), maxLines: 3,),
                        VerticalSpacing(height: 10),
                        Row(
                          children: [
                            Image.asset(Img.get('outdoor.png'), height: 20, width: 20,),
                            SizedBox(width: 10,),
                            Text("Outdoor Space", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17),),
                          ],
                        ),
                        VerticalSpacing(height: 3),
                        Row(
                          children: [
                            Image.asset(Img.get('parking.png'), height: 20, width: 20,),
                            SizedBox(width: 10,),
                            Text("Parking", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17),),
                          ],
                        ),
                        VerticalSpacing(height: 3),
                        Row(
                          children: [
                            Image.asset(Img.get('transport.png'), height: 20, width: 20,),
                            SizedBox(width: 10,),
                            Text("Close to Public Transportation", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17),),
                          ],
                        ),
                        VerticalSpacing(height: 3),
                        Row(
                          children: [
                            Image.asset(Img.get('management.png'), height: 20, width: 20,),
                            SizedBox(width: 10,),
                            Text("Professional Management", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17),),
                          ],
                        ),
                        VerticalSpacing(height: 3),
                        Row(
                          children: [
                            Image.asset(Img.get('laundry.png'), height: 20, width: 20,),
                            SizedBox(width: 10,),
                            Text("Laundry Facilities", style: MyText.body1(context)!.copyWith(color: MyColor.textColor2, fontSize: 17),),
                          ],
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                            width: double.maxFinite,
                            height: 60,
                            decoration: BoxDecoration(
                              border:  Border.all(
                                color: MyColor.textColor1,
                              ),
                              borderRadius: BorderRadius.circular(5), // Set the border radius
                              color: Colors.white, // Set the background color
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,// Make the button background transparent
                                elevation: 0, // Remove button elevation
                              ),
                              child: Text('Show More',style: MyText.subtitle(context)!
                                  .copyWith(color: Colors.black)),
                            ),
                          ),
                      ],
                    ),
                  VerticalSpacing(height: 10),
                 Line(),
                  VerticalSpacing(height: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text("Where you’ll be", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17), maxLines: 3,),
                        VerticalSpacing(height: 10),
                        Text("Staford, Virgnia, United States", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 17),),
                        VerticalSpacing(height: 10),
                        Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0XFFA7BCC7),
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            width: double.infinity,
                            height: 300,
                            child: GoogleMap(
                              markers: Set.of(_marker),
                              compassEnabled: true,
                              scrollGesturesEnabled: true,
                              rotateGesturesEnabled: true,
                              zoomControlsEnabled: true,
                              zoomGesturesEnabled: true,
                              mapToolbarEnabled: true,
                              tiltGesturesEnabled: true,
                              onMapCreated: _onMapCreated,
                              initialCameraPosition: CameraPosition(
                                target: center,
                                zoom: 17.0,
                              ),
                            ),
                          ),
                        VerticalSpacing(height: 10),
                        Line(),
                        VerticalSpacing(height: 10),
                      ],
                    ),
                  VerticalSpacing(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, size: 20,),
                            SizedBox(width: 3,),
                            Text("4.83 -", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17), maxLines: 3,),
                            SizedBox(width: 3,),
                            Text("30 reviews", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17), maxLines: 3,),
                          ],
                        ),
                      ],
                    ),
                  SizedBox(
                    height: 200,
                    child: Review(),
                  ),
                  VerticalSpacing(height: 10),
                  Container(
                      width: double.maxFinite,
                      height: 60,
                      decoration: BoxDecoration(
                        border:  Border.all(
                          color: MyColor.textColor1,
                        ),
                        borderRadius: BorderRadius.circular(5), // Set the border radius
                        color: Colors.white, // Set the background color
                      ),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.black,// Make the button background transparent
                          elevation: 0, // Remove button elevation
                        ),
                        child: Text('Show More',style: MyText.subtitle(context)!
                            .copyWith(color: Colors.black)),
                      ),
                    ),
                  VerticalSpacing(height: 10),
                  Line(),
                  VerticalSpacing(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Renter", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17),),
                        VerticalSpacing(height: 5),
                        Image.asset(Img.get('profile.png'), height: 60, width: 60, fit: BoxFit.cover,),
                        VerticalSpacing(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Text("We are live! Feel free to contact us via text or message. Our team is available and ready to assist you. Reach out to us using the contact information provided below.", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 15),),
                        ),
                        VerticalSpacing(height: 10),
                        Container(
                            width: double.maxFinite,
                            height: 60,
                            decoration: BoxDecoration(
                              border:  Border.all(
                                color: MyColor.textColor1,
                              ),
                              borderRadius: BorderRadius.circular(5), // Set the border radius
                              color: Colors.white, // Set the background color
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.black,// Make the button background transparent
                                elevation: 0, // Remove button elevation
                              ),
                              child: Text('Contact Renter',style: MyText.subtitle(context)!
                                  .copyWith(color: Colors.black)),
                            ),
                          ),
                      ],
                    ),
                  VerticalSpacing(height: 10),
                 Line(),
                  VerticalSpacing(height: 10),
                 Column(
                   mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Cancellation policy", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17, fontWeight: FontWeight.bold),),
                            ],
                          ),
                        VerticalSpacing(height: 10),
                        Flexible(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                    width: 300,
                                    child: Text("This reservation is refundablereview the hosts cancellation...", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 15), maxLines: 3,)),
                                Icon(Icons.arrow_forward_ios_rounded),
                              ],
                            ),
                        ),
                        VerticalSpacing(height: 10),

                      ],
                    ),
                  VerticalSpacing(height: 10),
                  Line(),
                  VerticalSpacing(height: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("House rules", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17, fontWeight: FontWeight.bold),),
                        VerticalSpacing(height: 5),
                        Text("Check in after 3:00 PM", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 15, fontWeight: FontWeight.normal),),
                        Text("Checkout before 11:00 PM", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 15, fontWeight: FontWeight.normal),),
                        Text("3 gusts maximum", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 15, fontWeight: FontWeight.normal),),
                        TextButton(onPressed: (){}, child: Text("Sow More"), )
                      ],
                    ),
                  VerticalSpacing(height: 10),
                  Line(),
                  VerticalSpacing(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("\$2000", style: MyText.subhead(context)!.copyWith(color: MyColor.textColor2, fontSize: 17, fontWeight: FontWeight.bold),),
                                SizedBox(width: 3,),
                                Text("night", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16, fontWeight: FontWeight.normal),),
                              ],),
                            Text("Apr 14-15", style: MyText.body1(context)!.copyWith(color: MyColor.textColor1, fontSize: 16, fontWeight: FontWeight.normal),),
                          ],
                        ),
                        Container(
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
                              child: Text('Reserve',style: MyText.subhead(context)!
                                  .copyWith(color: Colors.white)),
                            ),
                          ),
                      ],
                    ),
                  VerticalSpacing(height: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
