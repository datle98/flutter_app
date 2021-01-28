import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/items/item_category.dart';
import 'package:flutterapp/items/item_listview_home.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  bool isViewMore = false;
  List<Object> list = [];
  List<Object> list3 = [];

  @override
  void initState() {
    super.initState();
    createList6Item();
    createList3Item();
    insertDataList(list);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: SafeArea(
            child: Column(
              children: [
                appBar(),

                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: buildListWithData(context),
                )
              ],
            )
        )
    );
  }

  Widget appBar(){
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            iconSize: 24,
            icon: Image.asset('res/images/menu.png'),
            //   icon: Icon(Icons.menu_sharp),
            onPressed: _openLeftMenu()
          ),
          Expanded(child: searchAppBar(),),
          Image(
            image: AssetImage('res/images/ic_vip_member.png'),
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget searchAppBar(){
    return Container(
        padding: EdgeInsets.all(10.0),
        child: TextField(
            autocorrect: true,
            decoration: InputDecoration(
              hintText: 'Enter Your Email Here...',
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.grey),
              filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(color: Colors.green, width: 2),
              ),
            )));
  }

  Widget buildList(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          // if (index % 5 == 0) {
          if (index == 0) {
            return ItemCategory('Truyện nổi bật');
          } else if (index == 4 || index == 9) {
            return TextButton(
              onPressed: () => clickViewMore(isViewMore),
              child: Visibility(
                  child: Text(
                isViewMore ? 'Thu gọn' : 'Xem thêm',
                style: TextStyle(
                  color: Color.fromRGBO(30, 86, 42, 1),
                  fontSize: 14,
                ),
              )),
            );
          } else if (index == 5) {
            return ItemCategory('Truyện mới nhất');
          } else
            return ItemList(
                index,
                1000 + index,
                'Truyện Kiều Truyện Kiều Truyện Kiều Truyện Kiều $index',
                index % 2 == 0);
        },
        // itemCount: isViewMore ? 9 : 5,
        itemCount: list.length,
      ),
    );
  }

  Widget buildListWithData(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (list[index] is ItemCategory) {
            return ItemCategory((list[index] as ItemCategory).category);
          } else if (list[index] is String) {
            return TextButton(
              onPressed: () => clickViewMore(isViewMore),
              child: Visibility(
                  child: Text(
                isViewMore ? 'Thu gọn' : 'Xem thêm',
                style: TextStyle(
                  color: Color(0xFF42A5F5),
                  fontSize: 14,
                ),
              )),
            );
          } else if (list[index] is ItemList) {
            ItemList item = list[index] as ItemList;
            return ItemList(item.pos, item.view, item.name, item.vip);
          } else
            return null;
        },
        itemCount: list.length,
      ),
    );
  }

  clickViewMore(bool isViewMore) {
    setState(() {
      this.isViewMore = !isViewMore;

      if (isViewMore) {
        list.removeRange(4, 7);
      }else{
        list.insertAll(4, list3);
      }

      print('Click view more $list');
    });
  }

  createList6Item() {
    for (var i = 0; i < 6; i++) {
      list.add(ItemList(
          i + 1,
          1000 + i,
          'Truyện Ma - Nguyễn Ngọc Ngạn Chapter ahihihihihihihi $i',
          i % 2 == 0));
    }

    list.insert(0, ItemCategory('Truyện nổi bật'));
    list.insert(4, 'Xem thêm');
    list.insert(5, ItemCategory('Truyện mới nhất'));
    list.insert(9, "Xem thêm");
  }

  createList3Item() {
    for (var i = 0; i < 3; i++) {
      list3.add(ItemList(
          i + 1,
          1000 + i,
          'Truyện Ma Added $i',
          i % 2 == 0));
    }
  }

  insertDataList(List<Object> list) {
    print('$list');
  }

  _openLeftMenu() {}
}
