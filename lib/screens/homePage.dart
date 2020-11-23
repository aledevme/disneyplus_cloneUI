import 'package:disneyplus_cloneui/models/Brand.dart';
import 'package:disneyplus_cloneui/models/Content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  SwiperController _controller = SwiperController();

  List<Content> contentsSwiper = [
    Content(
      id: 1,
      urlImage: 'assets/poster/darkphoenix.jpg',
    ),
    Content(
      id: 2,
      urlImage: 'assets/poster/endgame.jpg'
    ),
    Content(
      id: 3,
      urlImage: 'assets/poster/mandalorian.jpg',
      notification: 'New episode now streaming'
    ),
    Content(
      id: 4,
      urlImage: 'assets/poster/mulanlarge.jpg' 
    ),
    Content(
      id: 5,
      urlImage: 'assets/poster/riseofskywalker.jpg',
      notification: 'Coming to disney+ on December 6'
    ),
    Content(
      id: 6,
      urlImage: 'assets/poster/freesolo.jpg',
      notification: 'Now Streaming'
    ),
  ];

  List<Brand> brandsItems = [
    Brand(
      brandName: 'Disney',
      urlImage: 'assets/poster/brands/disney.png'
    ),
    Brand(
      brandName: 'Pixar',
      urlImage: 'assets/poster/brands/pixar.png'
    ),
    Brand(
      brandName: 'Marvel',
      urlImage: 'assets/poster/brands/marvel.png'
    ),
    Brand(
      brandName: 'Star wars',
      urlImage: 'assets/poster/brands/starwars.png'
    ),
    Brand(
      brandName: 'National Geographic',
      urlImage: 'assets/poster/brands/ng.png'
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xff373a41)
          /*gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.blueGrey[900],
              Colors.blue[100]
            ]
          )*/
        ),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate( 
                [
                  sliderTopContent(),
                  brands()
                ]
              ) 
            )
          ],
        ),
      ),
    );
  }

  Widget appBar(){
    return AppBar(
      backgroundColor: Color(0xff373a41),
      elevation: 0,
      title: Image(
        height: 100,
        width: 100,
        image: AssetImage('assets/poster/disneypluslogowhite.png'),
      ),
    );
  }

  Widget sliderTopContent(){
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 10
        ),
        height: 200,
        child: Swiper(
        viewportFraction: 0.9,
        scale: 0.95,
        controller: _controller,
        itemCount: contentsSwiper.length,
        itemBuilder: (BuildContext context, int index){
          return ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Stack(
              fit: StackFit.expand,
              children: [
                FadeInImage(
                  fit: BoxFit.cover,
                  image: AssetImage(contentsSwiper[index].urlImage),
                  placeholder: AssetImage('assets/poster/loader.gif'),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Text(contentsSwiper[index].notification == null ? '' : contentsSwiper[index].notification,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ],
            )
          );
        },      
      ),
    );
  }

  Widget brands(){
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        children: brandsItems.asMap().map((int index, value) => 
          MapEntry(index, 
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff1d3461),
                    Colors.blue[900]
                  ]
                )
              ),
              padding: EdgeInsets.all(5),
              child: FadeInImage(
                width:50,
                height: 50,
                fit: BoxFit.fitWidth,
                image: AssetImage(value.urlImage),
                placeholder: AssetImage('assets/poster/loader.gif'),
              ),
            )
          )
        ).values.toList(),
      )
    );
  }
}