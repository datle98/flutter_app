import 'package:flutter/widgets.dart';
import 'package:flutterapp/items/item_listview_home.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildList(context);
  }

  Widget buildList(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ItemHome(index, 1000);
      },
      itemCount: 3,
    );
  }
}
