import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/utility/size_config.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  List<String> urlItems = [
    "https://ichef.bbci.co.uk/ace/ws/800/cpsprodpb/3ee9/live/9e9aede0-45b7-11ef-b74c-bb483a802c97.jpg.webp",
    "https://ichef.bbci.co.uk/ace/ws/800/cpsprodpb/d44e/live/fd844da0-45b8-11ef-96a8-e710c6bfc866.jpg.webp",
    "https://ichef.bbci.co.uk/ace/ws/800/cpsprodpb/0b3b/live/6f91f190-c55d-11ee-ace0-c35c1b4f6d82.jpg.webp",
    "https://ichef.bbci.co.uk/ace/ws/800/cpsprodpb/16b8/live/3b4aaef0-23f3-11ef-8907-376ff8d07cb6.jpg.webp",
    "https://ichef.bbci.co.uk/ace/ws/800/cpsprodpb/59e1/live/07fda410-27e2-11ef-baa7-25d483663b8e.png.webp",
    "https://iasbh.tmgrup.com.tr/7b3005/752/395/0/14/738/403?u=https://isbh.tmgrup.com.tr/sbh/2024/07/31/cag-universitesinden-gururlandiran-basari-1722450177863.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: urlItems.map((i) {
        var index = urlItems.indexOf(i);
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.screenHeight! * 0.02,
            horizontal: SizeConfig.screenWidth! * 0.02,
          ),
          child: Builder(
            builder: (BuildContext context) {
              return Container(
                width: SizeConfig.screenWidth!,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Image.network(
                  urlItems[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: SizeConfig.screenHeight! * 0.28,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
