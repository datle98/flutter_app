import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterapp/custom_views/custom_banner_slider.dart';
import 'package:flutterapp/items/item_category.dart';
import 'package:flutterapp/items/item_listview_home.dart';
import 'package:flutterapp/screens/purchase_vip.dart';

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

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            child: Scaffold(
              // appBar: AppBar(
              //   backgroundColor: Colors.white,
              //   leading: Builder(
              //     builder: (context) =>
              //         GestureDetector(
              //           onTap: () => Scaffold.of(context).openDrawer(),
              //           child: Padding(
              //             padding: EdgeInsets.all(16),
              //             child: Image(
              //               image: AssetImage('res/images/menu.png'),
              //               width: 24,
              //               height: 24,
              //             ),
              //           ),
              //         ),
              //   ),
              //   flexibleSpace: buildAppBar(context),
              // ),
              drawer: Drawer(
                child: Container(),
              ),
              body: Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    buildAppBar(context),
                    Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          controller: ScrollController(),
                          child: buildListWithData(context),
                        )
                    )
                  ],
                ),
              ),
            )
        );
  }

  Widget buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Builder(
            builder: (context) =>
                GestureDetector(
                  onTap: () => Scaffold.of(context).openDrawer(),
                  child: Image(
                    image: AssetImage('res/images/menu.png'),
                    width: 30,
                    height: 30,
                  ),
                ),
          ),
          Expanded(
            child: searchAppBar(),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  PurchaseVip(),)),
            child: Image(
              image: AssetImage('res/images/ic_vip_member.png'),
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget searchAppBar() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      child: RawMaterialButton(
        fillColor: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: const <Widget>[
            Icon(
              Icons.search,
              size: 18,
              color: Color.fromRGBO(0, 0, 0, 1),
            ),
            Text(
              "Tìm kiếm truyện",
              maxLines: 1,
              style: TextStyle(
                color: Color.fromRGBO(0, 0, 0, 1),
                fontSize: 15,
              ),
            ),
          ],
        ),
        shape: StadiumBorder(
            side: BorderSide(color: Color.fromRGBO(30, 86, 42, 1), width: 1)),
      ),
      // TextFormField(
      //   // textAlign: TextAlign.center,
      //   textAlignVertical: TextAlignVertical.center,
      //   decoration: InputDecoration(
      //     isDense: true,
      //     border: OutlineInputBorder(
      //       borderRadius: BorderRadius.all(Radius.circular(40.0)),
      //       borderSide: BorderSide(color: Colors.green, width: 1),
      //     ),
      //     prefixIcon: Icon(Icons.search),
      //     isCollapsed: false,
      //     hintStyle: TextStyle(color: Colors.grey),
      //     hintText: 'Tìm kiếm truyện',
      //
      //   ),
      // )
    );
  }

  Widget buildListWithData(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => checkType(index),
      itemCount: list.length,
    );
  }

  clickViewMore(bool isViewMore) {
    setState(() {
      this.isViewMore = !isViewMore;

      if (isViewMore) {
        list.removeRange(5, 8);
      } else {
        list.insertAll(5, list3);
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

    list.insert(0, 1);
    list.insert(1, ItemCategory('Truyện nổi bật'));
    list.insert(5, 'Xem thêm');
    list.insert(6, ItemCategory('Truyện mới nhất'));
    list.insert(10, "Xem thêm");
  }

  createList3Item() {
    for (var i = 0; i < 3; i++) {
      list3.add(ItemList(i + 1, 1000 + i, 'Truyện Ma Added $i', i % 2 == 0));
    }
  }

  insertDataList(List<Object> list) {
    print('$list');
  }

  _openLeftMenu() {}

  Widget checkType(int index) {
    if (list[index] is int) {
      return CustomBannerSlider();
    } else if (list[index] is ItemCategory) {
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
      return Container();
  }
}
