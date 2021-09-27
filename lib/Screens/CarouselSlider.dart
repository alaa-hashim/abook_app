import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:from_ui_app/classes/Photos.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class Carousel extends StatefulWidget {
  const Carousel({Key key}) : super(key: key);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int actvieindex = 0 ;
  final controller = CarouselController() ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      child
        : Column(
        children: [
          CarouselSlider.builder(
            carouselController:controller ,
              itemCount: photos.length,
              options: CarouselOptions(
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                onPageChanged: (index , reason) =>
                setState(() => actvieindex = index),

                scrollDirection: Axis.horizontal,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  height: 120,
                  width: 130,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage( 'assets/${photos[index]}'),
                        fit: BoxFit.cover,
                      )),
                );

              }),
          SizedBox(height: 32,),
          buildIndecotar(),
        ],
      ),
    );

  }
  Widget buildIndecotar() => AnimatedSmoothIndicator(
    activeIndex: actvieindex,
    count:  photos.length,

    effect: JumpingDotEffect(
      dotWidth: 15,
      dotHeight: 15,
      activeDotColor: Colors.blue ,
    ),
  );

}
