import 'package:flutter/material.dart';

class PurchaseVip extends StatefulWidget {
  @override
  _PurchaseVipState createState() => _PurchaseVipState();
}

class _PurchaseVipState extends State<PurchaseVip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
