import 'dart:math';
import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resumemaker/models/template_typeModel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import '../utils/const/size.dart';
import '../utils/const/textStyle.dart';
import 'widgets/Template_item.dart';

// Define a model class for your items
class Item {
  final String title;
  final String imageUrl;

  Item(this.title, this.imageUrl);
}

// Define a provider class to manage your item data
class ItemProvider with ChangeNotifier {
  List<Template_TypeModel> _items = [
    Template_TypeModel(text: 'Item 1', imagePath: 'https://gdoc.io/uploads/University-Student-Resume-Template-web1.jpg'),
    Template_TypeModel(text: 'Item 2', imagePath: 'https://gdoc.io/uploads/University-Student-Resume-Template-web1.jpg'),
Template_TypeModel(text: 'Item 2', imagePath: 'https://marketplace.canva.com/EAE8mhdnw_g/2/0/1131w/canva-grey-clean-cv-resume-photo-pIsBixsev8I.jpg'),
Template_TypeModel(text: 'Item 2', imagePath: 'https://marketplace.canva.com/EAE8mhdnw_g/2/0/1131w/canva-grey-clean-cv-resume-photo-pIsBixsev8I.jpg'),
Template_TypeModel(text: 'Item 2', imagePath: 'https://gdoc.io/uploads/University-Student-Resume-Template-web1.jpg'),
    // Add more items here...
  ];

  List<Template_TypeModel> get items => _items;
}

class Template_Type extends StatelessWidget {
    var rng = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body:  Stack(
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
                      'choose one of them',
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
              child:      
      ChangeNotifierProvider(
        create: (context) => ItemProvider(),
        child: Consumer<ItemProvider>(
          builder: (context, itemProvider, _) {
            
            return 
            
            GridView.builder(
              padding: EdgeInsets.zero,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
        
                mainAxisSpacing: 0.2,

                childAspectRatio: 0.7, 
                crossAxisSpacing: 2,
                // Adjust the aspect ratio as needed
              ),
              itemCount: itemProvider.items.length,
              itemBuilder: (context, index) {
                Template_TypeModel item = itemProvider.items[index];
                return TemplateItem(template_typeModel: item);
              },
            );
          },
        ),
      ),
              
              //  ListView.builder(
              //   itemCount: items.length,
              //   padding: EdgeInsets.zero,
              //   itemBuilder: (context, index) {
              //     final item = items[index];
            
              //     return CategoryItem(
              //             category_item: item,
              //             index: index,
                          
                    
              //     )
              //     ;
              //   },
              // ),
            )
           )
         
          ],
        )
      
      // ChangeNotifierProvider(
      //   create: (context) => ItemProvider(),
      //   child: Consumer<ItemProvider>(
      //     builder: (context, itemProvider, _) {
      //       return GridView.builder(
      //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2,
      //           childAspectRatio: 0.8, // Adjust the aspect ratio as needed
      //         ),
      //         itemCount: itemProvider.items.length,
      //         itemBuilder: (context, index) {
      //           Item item = itemProvider.items[index];
      //           return RoundedItemCard(item: item);
      //         },
      //       );
      //     },
      //   ),
      // ),
    
    );
  }
}


