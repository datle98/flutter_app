import 'dart:ffi';

import 'package:flutter/material.dart';

class ItemHome extends StatelessWidget {
  final int pos;
  final int view;

  const ItemHome(this.pos, this.view);

  @override
  Widget build(BuildContext context) {
    return item(pos, view);
  }

  Widget item(int pos, int view) {
    return Container(

      child: Row(
        children: [
          Text(
            '$pos',
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          Image(
            image: AssetImage('res/images/banner.png'),
            width: 44,
            height: 44,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Truyện Kiều',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  Image(
                    image: AssetImage('res/images/banner.png'),
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
              Text(
                'Thể loại: Truyện cổ tích',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Lượt xem: $view',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
