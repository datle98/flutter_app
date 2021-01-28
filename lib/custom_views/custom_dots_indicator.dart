import 'dart:ffi';

import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  bool isSelected = true;

  final ValueChanged<int> onPageSelected;

  Widget _buildDot(int index) {
    isSelected = controller.page == index;
    return new Container(
      width: 10,
      child: new Center(
        child: new Material(
          color: isSelected ? Color.fromRGBO(171, 54, 17, 1) : Color.fromRGBO(241, 226, 207, 1),
          type: MaterialType.circle,
          child: new Container(
            width: 6,
            height: 6,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
