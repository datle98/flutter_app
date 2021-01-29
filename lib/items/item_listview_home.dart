import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  final int pos;
  final int view;
  final String name;
  final bool vip;

  ItemList(this.pos, this.view, this.name, this.vip);

  @override
  Widget build(BuildContext context) {
    return itemListView();
  }

  Widget itemListView() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Stack(
            children: [
              Row(
                children: [
                  rankingPosition(),
                  SizedBox(width: 8),
                  Image(
                    image: AssetImage('res/images/thumbnail.png'),
                    width: 56,
                    height: 56,
                  ),
                  SizedBox(width: 8),
                  contentItem()
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Visibility(
                  visible: vip,
                  child: Image(
                    image: AssetImage('res/images/ic_vip.png'),
                    width: 16,
                    height: 16,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Divider(
            height: 2,
            color: Color.fromRGBO(181, 190, 183, 1),
          )
        ],
      ),
    );
  }

  Widget contentItem() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color.fromRGBO(15, 15, 15, 0.86),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Thể loại: Truyện cổ tích',
              style: TextStyle(
                color: Color.fromRGBO(79, 79, 79, 1),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Lượt nghe: $view',
              style: TextStyle(
                color: Color.fromRGBO(79, 79, 79, 1),
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rankingPosition() {
    return Container(
      margin: EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color.fromRGBO(191, 136, 119, 1),
        width: 1.0, // Underline thickness
      ))),
      child: Text(
        '0$pos',
        style: TextStyle(
            color: Color.fromRGBO(191, 136, 119, 1),
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
    );
  }

// Container(
//   padding: EdgeInsets.only(left: 8),
//   child: Text(
//     '$pos',
//     style: TextStyle(
//         color: Color.fromRGBO(191, 136, 119, 1),
//         fontSize: 14,
//
//         fontWeight: FontWeight.bold,
//         decoration: TextDecoration.underline,
//         decorationThickness: 2,
//         decorationStyle: TextDecorationStyle.solid,
//         decorationColor: Color.fromRGBO(191, 136, 119, 1)),
//   ),
// ),
}
