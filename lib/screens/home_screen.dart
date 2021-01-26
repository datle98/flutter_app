import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/items/item_listview_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: buildList(context)));
  }

  Widget buildList(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ItemList(index, 1000);
        },
        itemCount: 3,
        separatorBuilder: (BuildContext context, int index) => const Divider(
              height: 2,
              color: Color.fromRGBO(181, 190, 183, 1),
            ));
  }
}
