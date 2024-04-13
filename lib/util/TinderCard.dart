import 'package:flt_firebase/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TinderCard extends StatefulWidget {
  bool bg_dark = false;
  TinderCard({Key?key, required this.bg_dark}) : super(key: key);

  @override
  State<TinderCard> createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard>{
  int activeIndex = 0;
  final controller = CarouselController();
  String gp = "";


  final imageurl =
  [ 'https://w0.peakpx.com/wallpaper/844/692/HD-wallpaper-god-of-war-game-gaming-godofwar.jpg',
    'https://w0.peakpx.com/wallpaper/888/58/HD-wallpaper-ludo-ludo-game.jpg',
    'https://w0.peakpx.com/wallpaper/436/907/HD-wallpaper-skull-black-dark-crown-3d.jpg',
    'https://w0.peakpx.com/wallpaper/836/976/HD-wallpaper-spiderman-poster-spiderman-movie.jpg',
    'https://w0.peakpx.com/wallpaper/829/680/HD-wallpaper-hidden-black-dark-horror-mask-scary.jpg',
    'https://w0.peakpx.com/wallpaper/60/50/HD-wallpaper-spiderman-homecoming-peter-parker-marvel.jpg',
    'https://w0.peakpx.com/wallpaper/416/579/HD-wallpaper-red-rapping-hood-alone-amoled-black-dark-hoodie-hq-music-night-person-red.jpg',
    'https://w0.peakpx.com/wallpaper/93/753/HD-wallpaper-black-panther-black-panther-marvel.jpg',
    'https://w0.peakpx.com/wallpaper/665/352/HD-wallpaper-mask-neon-dark-darkness.jpg',
    'https://w0.peakpx.com/wallpaper/981/593/HD-wallpaper-hacker-dark-mask.jpg',
    'https://w0.peakpx.com/wallpaper/348/653/HD-wallpaper-spiderman-dark.jpg',
    'https://w0.peakpx.com/wallpaper/869/552/HD-wallpaper-dark-vertical-red-black-portrait-display.jpg',
    'https://w0.peakpx.com/wallpaper/376/804/HD-wallpaper-samurai-black-dark-red.jpg',
    'https://w0.peakpx.com/wallpaper/812/721/HD-wallpaper-women-model-dark-hair-simple-background-dark-background-black-background-vertical-collar-bone-skinny-lipstick-glitter-face-paint-colorful-looking-below-body-paint-dark-lipstick-blue-purple.jpg'
  ];

  void show_toast(){
    Fluttertoast.showToast(
                  msg: "Wallpaper Applied",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  textColor: Colors.black,
                  fontSize: 16.0,
                  backgroundColor: Colors.white
                );
  }
  void set_wall(String gp) async{
    if(gp == 'home') {
      int location = WallpaperManager.HOME_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(
          imageurl[activeIndex]);
      final bool result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
    }
    else if(gp == 'lock'){
      int location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(imageurl[activeIndex]);
      final bool result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
    }else if(gp == 'both'){
      int location = WallpaperManager.BOTH_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(imageurl[activeIndex]);
      final bool result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
    }
  }
  void dlg_box() async{
    showDialog(
        context: context,
        builder: (context){
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              title: Text("Apply"),
              content: Container(
                height: 150,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Radio(
                            autofocus: false,
                            value: "home",
                            groupValue: gp,
                            onChanged: (value){
                              gp = value.toString();
                              setState(() {
                                Navigator.pop(context);
                                show_toast();
                                set_wall(gp);
                                gp ='';
                              });
                            }),
                        Text("Set Home Screen")
                      ],
                    ),

                    Row(
                      children: [
                        Radio(
                          autofocus: false,
                            value: "lock",
                            groupValue: gp,
                            onChanged: (value){
                              gp = value.toString();
                              setState(() {

                                Navigator.pop(context);
                                show_toast();
                                set_wall(gp);
                                gp = '';
                              });
                            }),
                        Text("Set lock Screen")
                      ],
                    ),

                    Row(
                      children: [
                        Radio(
                          autofocus: false,
                            value: "both",
                            groupValue: gp,
                            onChanged: (value){
                              gp = value.toString();
                              setState(() {

                                Navigator.pop(context);
                                show_toast();
                                set_wall(gp);
                                gp = '';
                              });
                            }),
                        Text("Set both Screen"),

                      ]
                    ),

                  ],
                ),
              ),
            );
          },);
        });
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 500,
            child: CarouselSlider.builder(
                carouselController: controller,
                itemCount: imageurl.length,
                itemBuilder: (context, index, realIndex) => Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(imageurl[index],
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                ),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  height: 500,
                  onPageChanged: (index,reason){
                    activeIndex = index;
                  }
            )),
          ),

          //Space
          const SizedBox(height: 40,),


          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: GestureDetector(
              onTap: () async{
                //Dialogue Box For Home,Lock,Both
                dlg_box();
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: widget.bg_dark?Colors.grey[900]:Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: widget.bg_dark?Colors.black:Colors.grey.shade500,
                        offset: Offset(5,5),
                        blurRadius: 9,
                        spreadRadius: 2
                      ),

                       BoxShadow(
                          color: widget.bg_dark?Colors.grey.shade800:Colors.white,
                          offset: Offset(-5,-5),
                          blurRadius: 9,
                          spreadRadius: 2
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.format_paint_outlined,color: widget.bg_dark?Colors.white:Colors.black,),
                    Text("Apply",
                      style: TextStyle(fontSize: 20,color: widget.bg_dark?Colors.white:Colors.black),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
}

