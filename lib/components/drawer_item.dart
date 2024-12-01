import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  Function onClicked;

  DrawerItem(this.onClicked);

  static int category = 0;
  static int setting = 1;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 350,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            color: Colors.green,
            height: 100,
          ),
          SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              onClicked(category);
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.category_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Categories",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
            },
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.settings,
                  size: 30,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Settings",
                  style: TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
