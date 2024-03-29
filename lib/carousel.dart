import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  var aImages;
  ImageCarousel(this.aImages);
  @override
  _ImageCarouselState createState() => new _ImageCarouselState(this.aImages);
 }

class _ImageCarouselState extends State<ImageCarousel> {
  var aImage, autorep, indicador;
 _ImageCarouselState(this.aImage);
  
  @override
  void initState() {
    super.initState();
       
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.width;
    Widget carouselmage = new Container(
      height: MediaQuery.of(context).size.height,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: aImage,
        autoplay: true,
        autoplayDuration: Duration(seconds: 4),
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 2000),
        showIndicator: true,
        indicatorBgPadding: 5.0,
      ),
    );
    
    return SingleChildScrollView(
       child:Column(
         children: <Widget>[
           new Container(
             height: screenHeight,
             child: new ClipRRect(
               borderRadius: BorderRadius.circular(30.0),
               child: new Stack(
                 children: [
                  //  Text(
                  //    'solo 3 sensillos pasos\n\n',
                  //    textAlign: TextAlign.center,
                  //    style: TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic),
                  //  ),
                   carouselmage,
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}