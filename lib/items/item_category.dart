import 'package:flutter/cupertino.dart';

class ItemCategory extends StatelessWidget {
  String category;

  ItemCategory(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 4, top: 10),
      child: Text(
        '$category',
        style: TextStyle(
            color: Color.fromRGBO(15, 15, 15, 0.86),
            fontSize: 14,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
