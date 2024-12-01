import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/components/sources_title.dart';
import 'package:news/models/category_model.dart';
import 'package:news/network/api_manager.dart';
import 'package:news/screens/news_screen/categories_screen.dart';
import 'package:news/screens/news_screen/news_screen.dart';
import 'package:news/screens/news_screen/search_widget.dart';
import '../../components/drawer_item.dart';
import '../../components/source_item.dart';
import '../../models/NewsDataModel.dart';
import 'categories_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'news';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSource = 0;
  bool isIconClicked = false;
  List<Articles> allArticles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
      DrawerItem(onDrawerClicked),
      appBar: AppBar(
        titleSpacing: 1,
        toolbarHeight: 50,
        title: buildAppBarTitle(),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showSearch(context: context, delegate: NewsSearch());
              });
            },
            icon: Icon(Icons.search),
          ),
        ],
        backgroundColor: Color(0xFF39A552),
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      body: model == null
          ? CategoriesScreen(onCategoryClicked)
          : NewsScreen(model!),
    );
  }

  CategoryModel? model = null;

  onCategoryClicked(categorymodel) {
    model = categorymodel;
    setState(() {});
  }

  onDrawerClicked(number) {
    if (number == DrawerItem.category) {
      model = null;
      Navigator.pop(context);
      setState(() {});
    } else if (number == DrawerItem.setting) {}
  }

  Widget buildAppBarTitle() {
    return Center(
      child: Container(
        child: Text(
          "News App",
          style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w100),
        ),
      ),
    );
  }
}
