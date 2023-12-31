import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../api/api_clients.dart';

class CarouseSliderHome extends StatefulWidget {
  @override
  _CarouseSliderHomeState createState() => _CarouseSliderHomeState();
}

class _CarouseSliderHomeState extends State<CarouseSliderHome> {
  final ApiClient _apiClient = ApiClient();
  Future<void> getBannerHome() async {
    dynamic res = await _apiClient.getBanner();
    listItem.clear();
    List listImgs = res as List;
    res.forEach(
      (element) => listItem.add(SlideItem(imageLink: element["imgUrl"])),
    );
    setState(() {});
    //return res;
  }

  var listItem = [
    SlideItem(imageLink: "assets/images/banner1.png"),
    SlideItem(imageLink: "assets/images/banner2.jfif"),
    SlideItem(imageLink: "assets/images/logo.jpg"),
  ];

  int current = 0;

  @override
  void initState() {
    super.initState();
    getBannerHome();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: listItem,
        options: CarouselOptions(
          height: 150.0,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 1,
          onPageChanged: (pageIndex, reason) {
            setState(() {
              current = pageIndex;
            });
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(listItem.length, (i) => i + 1).map((e) {
          int listIndex =
              List.generate(listItem.length, (i) => i + 1).indexOf(e);
          return Container(
            width: current == listIndex ? 16 : 4,
            height: 4,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2.5),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: current == listIndex
                  ? Theme.of(context).primaryColor
                  : Color.fromRGBO(0, 0, 0, 0.4),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          );
        }).toList(),
      )
    ]);
  }
}

class SlideItem extends StatelessWidget {
  SlideItem({required this.imageLink});

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageLink),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
