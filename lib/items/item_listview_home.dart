import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final int pos;
  final int view;

  const ItemList(this.pos, this.view);

  @override
  Widget build(BuildContext context) {
    return item(pos, view);
  }

  Widget item(int pos, int view) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top:12, left: 16, right: 24, bottom: 12),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '$pos',
                  style: TextStyle(
                      color: Color.fromRGBO(191, 136, 119, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      decorationColor: Color.fromRGBO(191, 136, 119, 1)),
                ),
                SizedBox(height: 14),
                Image(
                  image: AssetImage('res/images/thumbnail.png'),
                  width: 56,
                  height: 56,
                ),
                SizedBox(height: 14),
                Container(
                  child: Column(
                    children: [
                      Text(
                        'Truyện Kiều',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
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
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Image(
                    image: AssetImage('res/images/ic_vip.png'),
                    width: 16,
                    height: 16,
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
