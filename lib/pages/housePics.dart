import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../constants/images.dart';
class HousePics extends StatefulWidget {
  final List images;
  const HousePics({super.key, required this.images});

  @override
  State<HousePics> createState() => _HousePicsState();
}

class _HousePicsState extends State<HousePics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
              alignment: Alignment.center,
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(200)),
                color: Colors.white,
              ),
              child: IconButton(onPressed: () {Navigator.pop(context);  }, icon: Icon(Icons.arrow_back_ios_new_outlined, size: 20,),)),
        ),
        actions: [
          Image.asset(Img.get('upload.png'), height: 30, width: 30,),
          SizedBox(width: 10,),
          Image.asset(Img.get('whishlist.png'), height: 30, width: 30,),
          SizedBox(width: 10,),
        ],
      ),
      body: MasonryGridView.builder(
        itemCount: widget.images.length,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Image.asset(Img.get(widget.images[index]));
        },
      ),
    );
  }
}
