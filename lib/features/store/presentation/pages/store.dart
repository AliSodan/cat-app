import 'package:cats_app/core/constants/app_colors.dart';
import 'package:cats_app/features/store/data/api/get_categories.dart';
import 'package:cats_app/features/store/data/model/category_model.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatefulWidget {
  StoreScreen({Key? key}) : super(key: key);

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  GetCategories getCategories = GetCategories();
  List<CategoryModel> categories = [];
  @override
  void initState() {
    getCategories.call().then((value) {
      setState(() {
        categories = value;
        print(categories  );
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, i) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colorful.mainColor,
                    child: Text(
                      '${categories[i].id}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  title: Text(
                    categories[i].name,
                    style: TextStyle(color: Colorful.mainColor, fontSize: 18),
                  ),
                );
              })
          ,
    );
  }
}
