import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapp/custom_views/custom_dots_indicator.dart';

class CustomBannerSlider extends StatefulWidget {
  @override
  _CustomBannerSliderState createState() => _CustomBannerSliderState();
}

List<String> packages = [
  'res/images/img_slider_1.png',
  'res/images/img_slider_2.png',
  'res/images/img_slider_3.png',
  'res/images/img_slider_4.png'
];

class _CustomBannerSliderState extends State<CustomBannerSlider> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < packages.length - 1) {
        _currentPage++;
      } else
        _currentPage = 0;

      controller.animateToPage(_currentPage,
          curve: Curves.decelerate, duration: Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 200,
          child: PageView.builder(
            itemCount: packages.length,
            controller: controller,
            pageSnapping: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Image(
                image: AssetImage(packages[index]),
              );
            },
          ),
        ),
        Container(
          height: 10,
          child: DotsIndicator(
            controller: controller,
            itemCount: packages.length,
            onPageSelected: (value) {},
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  final controller = PageController(initialPage: 0);
}
