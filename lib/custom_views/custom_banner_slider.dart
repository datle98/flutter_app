import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterapp/custom_views/custom_dots_indicator.dart';

class CustomBannerSlider extends StatefulWidget {
  @override
  _CustomBannerSliderState createState() => _CustomBannerSliderState();
}

class _CustomBannerSliderState extends State<CustomBannerSlider> {
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else
        _currentPage = 0;

      controller.animateToPage(_currentPage, curve: Curves.decelerate, duration: Duration(milliseconds: 500));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              pageSnapping: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Image(
                  image: AssetImage('res/images/banner.png'),
                );
              },
            ),
          ),
          DotsIndicator(
            controller: controller,
            itemCount: 3,
            onPageSelected: (value) {},
          )
        ],
      ),
    );
  }

  final controller = PageController(initialPage: 0);
}
