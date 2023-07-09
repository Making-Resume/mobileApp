import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SAvatarExampleChild extends StatelessWidget {
  String? urlPicture;
  SAvatarExampleChild({
    this.urlPicture,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 60,
        height: 80,
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(3),
          border:
              Border.all(color: Color.fromRGBO(143, 148, 251, .6), width: 2),
          color: Color.fromRGBO(143, 148, 251, .6),
          // image: DecorationImage(
          //   fit: BoxFit.cover,
          //   image: NetworkImage(
          //     'https://marketplace.canva.com/EAFUtflIkDU/2/0/1131w/canva-pink-black-%26-white-minimalist-photo-high-school-resume-wtTKJtesNFc.jpg',
          //     scale: 10,
          //   ),
          // ),
        ),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: CachedNetworkImage(
            fit: BoxFit.cover
            ,
            imageUrl: urlPicture!,
             placeholder: (context, url) =>
                   Center(
                     child: CircularProgressIndicator(
                                 //value: downloadProgress.progress,
                                 color: Colors.white,
                                 strokeWidth: 3,
                               ),
                   ),
            // progressIndicatorBuilder: (context, url, downloadProgress) =>
            //     Center(
            //         // widthFactor: 20,
            //         // heightFactor: 20,
            //         child: CircularProgressIndicator(
            //   value: downloadProgress.progress,
            //   color: Colors.white,
            //   strokeWidth: 3,
            // )),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          // Image(
          //   image: NetworkImage(

          //                   ),
          //   fit: BoxFit.cover, // use this
          // ),
        ),
      ),
    );
  }
}
