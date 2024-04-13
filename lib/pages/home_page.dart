import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flt_firebase/util/TinderCard.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget{
    
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  bool fav_bool = false;
  bool bg_dark= false;
  //document Ids

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_dark?Colors.grey[900]:Colors.grey[300],


      body: SafeArea(

        child:SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //other Activity
                  // Logout Botton
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: IconButton(onPressed: (){
                        FirebaseAuth.instance.signOut();
                      }, icon: Icon(Icons.logout,color: bg_dark?Colors.white:Colors.black,)),
                      decoration: BoxDecoration(
                        color: bg_dark?Colors.grey[900]:Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: bg_dark?Colors.black:Colors.grey.shade500,
                              offset: Offset(5,5),
                              blurRadius: 9,
                              spreadRadius: 2
                          ),

                           BoxShadow(
                              color: bg_dark?Colors.grey.shade800:Colors.white,
                              offset: Offset(-5,-5),
                              blurRadius: 9,
                              spreadRadius: 2
                          )
                        ]
                      ),
                    ),
                  ),

                  //Title of application
                  Text("Wally",style: GoogleFonts.pacifico(fontSize: 50,color: bg_dark?Colors.white:Colors.black),),

                  //Like button
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: IconButton(onPressed: (){
                        fav_bool = !fav_bool;
                        bg_dark = !bg_dark;
                        setState(() {
                        });
                      }, icon: (fav_bool)?Icon(Icons.nightlight,color: Colors.white,):Icon(Icons.wb_sunny_rounded)),
                      decoration: BoxDecoration(
                          color: bg_dark?Colors.grey[900]:Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: bg_dark?Colors.black:Colors.grey.shade500,
                                offset: Offset(5,5),
                                blurRadius: 9,
                                spreadRadius: 2
                            ),

                            BoxShadow(
                                color: bg_dark?Colors.grey.shade800:Colors.white,
                                offset: Offset(-5,-5),
                                blurRadius: 9,
                                spreadRadius: 2
                            )
                          ]
                      ),
                    ),
                  ),
                ],
              ),

              //Space
              SizedBox(height: 20,),

              //Images
             TinderCard(bg_dark: bg_dark,),

              //Space
              SizedBox(height: 50,),
              //Apply Button

              //Apply Button

          ]
          ),
        ),
      ),
    );
  }
}
