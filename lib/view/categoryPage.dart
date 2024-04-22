import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resumemaker/models/categoryModel.dart';
import 'package:resumemaker/models/category_item.dart';
import 'package:resumemaker/utils/const/size.dart';
import 'package:resumemaker/view/widgets/category_items.dart';

import '../utils/const/textStyle.dart';

class CategoryPage extends StatelessWidget {
  List<Category_Model>? categories = [];
  CategoryPage({this.categories});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(list_items: categories),
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        //   centerTitle: true,
        //   title: Container(
        //     width: 300.0,
        //     child: Center(
        //       child: DefaultTextStyle(
        //         textAlign: TextAlign.center,
        //         style: TextStyle1(
        //             color: Colors.white, fontWeight: FontWeight.bold, size: 15),
        //         child: AnimatedTextKit(
        //           isRepeatingAnimation: true,
        //           repeatForever: true,
        //           animatedTexts: [
        //             TypewriterAnimatedText(
        //               'templates',
        //               speed: Duration(milliseconds: 200),
        //             ),
        //           ],
        //           onTap: () {
        //             print("Tap Event");
        //           },
        //         ),
        //       ),
        //     ),
        //   ),

        //   // Text('Resumes  List',
        //   //           style: TextStyle1(
        //   //               color: Colors.white,
        //   //               size: 15,
        //   //            //   fontWeight: FontWeight.bold
        //   //               )),
        // ),
        body: ItemList(),
      ),
    );
  }
}

class ItemProvider extends ChangeNotifier {
  
  List<Category_Model>? list_items = [];
  ItemProvider({this.list_items});
  // List<Category_Item> _items = [
  //   Category_Item(
  //     imagePath: 'https://www.filepicker.io/api/file/4CcxWBfKQZOYlBlzOWU0',
  //     text: 'Item 1',
  //   ),
  //   Category_Item(
  //     imagePath: 'https://www.filepicker.io/api/file/GyYLma83SuiZfm6wY1mx',
  //     text: 'Item 2',
  //   ),
  //   Category_Item(
  //     imagePath: 'https://www.filepicker.io/api/file/GyYLma83SuiZfm6wY1mx',
  //     text: 'Item 2',
  //   ),
  //   Category_Item(
  //     imagePath: 'https://www.filepicker.io/api/file/4CcxWBfKQZOYlBlzOWU0',
  //     text: 'Item 1',
  //   ),
  //   Category_Item(
  //     imagePath: 'https://www.filepicker.io/api/file/GyYLma83SuiZfm6wY1mx',
  //     text: 'Item 2',
  //   ),
  //       Category_Item(
  //     imagePath: 'https://www.filepicker.io/api/file/GyYLma83SuiZfm6wY1mx',
  //     text: 'Item 2',
  //   ),
  //       Category_Item(
  //     imagePath: 'https://www.filepicker.io/api/file/GyYLma83SuiZfm6wY1mx',
  //     text: 'Item 2',
  //   ),
  //   // Add more items as needed
  // ];

  List<Category_Model> get items => list_items!;
}

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemProvider>(
      builder: (
        context,
        itemProvider,
        child,
      ) {
        final items = itemProvider.items;

        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(143, 148, 251, 1),
                // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
              ),
              height: DeviceSize.getHeight(context) * 0.15,
              width: DeviceSize.getWidth(context),
              child: Center(
                child: DefaultTextStyle(
                  textAlign: TextAlign.center,
                  style: TextStyle1(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      size: 15),
                  child: AnimatedTextKit(
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'templates',
                      speed: Duration(milliseconds: 200),
                    ),
                  ],
                  onTap: () {
                    print("Tap Event");
                  },
                ),
                ),
              ),
            ),
           Container(
             margin: EdgeInsets.only(top: 85),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25) , topRight: Radius.circular(25)),
                 color: Colors.white,
                 
              ),
            
            
              child: Container(
               margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25) , topRight: Radius.circular(25)),
              //   color: Colors.white,
                 
              ),
              child: ListView.builder(
                itemCount: items.length,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  final item = items[index];
            
                  return CategoryItem(
                          category_item: item,
                          index: index,
                          
                    
                  )
                  ;
                },
              ),
            )
           )
         
          ],
        );
      },
    );
  }
}
