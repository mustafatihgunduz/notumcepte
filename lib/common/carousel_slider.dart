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
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [1, 2, 3, 4, 5].map((i) {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: SizeConfig.screenHeight! * 0.03,
            horizontal: SizeConfig.screenWidth! * 0.03,
          ),
          child: Builder(
            builder: (BuildContext context) {
              return Container(
                  width: SizeConfig.screenWidth!,
                  margin: EdgeInsets.all(SizeConfig.screenWidth! * 0.01),
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Center(
                    child: Text(
                      'Text $i',
                      style: TextStyle(fontSize: SizeConfig.fontSize),
                    ),
                  ));
            },
          ),
        );
      }).toList(),
      options: CarouselOptions(
        height: SizeConfig.screenHeight! * 0.3,
        aspectRatio: 4 / 3,
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
