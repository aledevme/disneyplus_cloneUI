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
      urlImage: 'assets/poster/darkphoenix.jpg' 
    ),
    Content(
      id: 2,
      urlImage: 'assets/poster/endgame.jpg' 
    ),
    Content(
      id: 3,
      urlImage: 'assets/poster/mandalorian.jpg' 
    ),
    Content(
      id: 4,
      urlImage: 'assets/poster/mulanlarge.jpg' 
    ),
    Content(
      id: 5,
      urlImage: 'assets/poster/riseofskywalker.jpg' 
    ),
    Content(
      id: 6,
      urlImage: 'assets/poster/freesolo.jpg' 
    ),
    
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
                  sliderTopContent()
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
        height: 200,
        child: Swiper(
        viewportFraction: 0.9,
        scale: 0.95,
        controller: _controller,
        itemCount: contentsSwiper.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: FadeInImage(
                  fit: BoxFit.fitWidth,
                  image: AssetImage(contentsSwiper[index].urlImage),
                  placeholder: AssetImage('assets/poster/loader.gif'),
              ),
            ),
          );
        },      
      ),
    );
  }
  Widget brands(){
    
  }
}