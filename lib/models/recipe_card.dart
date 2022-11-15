import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_ui/wishlist_provider.dart';
import 'package:provider/provider.dart';

import 'RecipeModel.dart';

class RecipeCard extends StatefulWidget {
  final String title;
  final int servings;
  final String image;
  final int time;
  RecipeCard({
    required this.title,
    required this.image,
    required this.servings,
    required this.time,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool liked = false;
  List<Recipes>? _recipesList;


  @override
  Widget build(BuildContext context) {
    Wishlist_provider wishlist_provider = Provider.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 280,

      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(widget.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [

           // padding: const EdgeInsets.symmetric(horizontal: 330.0,vertical: 5),
             Positioned(
               top: 10,
                right: 10,
                child: InkWell(
              child:
                InkWell(
                  onTap: (){
                    setState(() {
                      liked=!liked;
                    });
                    if(liked == true)
                      {
                        wishlist_provider.addWishlistData(
                          wishlistservings: widget.servings,
                          wishlisttime:  widget.time,
                          wishlistimage: widget.image,
                          wishlisttitle: widget.title,

                        );

                      }
                  } ,
                  child: Icon(
                   liked ? FontAwesomeIcons.solidHeart  : FontAwesomeIcons.heart,
                    color: Colors.white,
                    size: 30,
                  ),

                )

            )),

          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                widget.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'DancingScript',
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(widget.servings.toString(),style: TextStyle(color: Colors.white),),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.schedule,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(widget.time.toString(),style: TextStyle(color: Colors.white),),
                      SizedBox(width: 3),
                      Text('min',style: TextStyle(color: Colors.white),)
                    ],
                  ),

                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );


  }
}