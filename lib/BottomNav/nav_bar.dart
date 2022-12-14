import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/BottomNav/cuisines.dart';
import 'package:login_ui/BottomNav/favourites.dart';
import 'package:login_ui/BottomNav/home_pg.dart';
import 'package:login_ui/BottomNav/welcome_page.dart';
import 'package:login_ui/BottomNav/nav_bar.dart';

class Nav_bar extends StatefulWidget {
  const Nav_bar({Key? key}) : super(key: key);

  @override
  State<Nav_bar> createState() => _Nav_barState();
}

class _Nav_barState extends State<Nav_bar> {
  int selectedindex=0;
  List<Widget> _WidgetOptions = <Widget>
  [
    home_pg(),
    Favourites(),
    Cousines(),
    WelcomePge(),
  ];
  void onItemTap(int index){
    setState(() {
      selectedindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),

      // appBar: AppBar(
      //   backgroundColor: Colors.deepPurple,
      //   title: Text("Home Page",
      //     style: TextStyle(
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: _WidgetOptions.elementAt(selectedindex),
      bottomNavigationBar: Container(
        color: Colors.grey.shade900,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 20.0),
            child:  NavigationBarTheme(
              data: NavigationBarThemeData(
                  indicatorColor: Colors.white,
                  height: 10.0,
                  labelTextStyle: MaterialStateProperty.all(
                    TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white),
                  )
              ),
              child: NavigationBar(
                height: 30,
                backgroundColor: Colors.grey.shade900,
                selectedIndex: selectedindex,
                onDestinationSelected: onItemTap,
                destinations: [
                  NavigationDestination(icon: Icon(Icons.home_filled,color: Colors.deepOrangeAccent,), label: 'Home',),
                  NavigationDestination(icon: Icon(Icons.favorite_rounded,color: Colors.deepOrangeAccent,), label: 'Favourites'),
                  NavigationDestination(icon: Icon(Icons.fastfood_rounded,color: Colors.deepOrangeAccent,), label: 'Cuisines'),
                  NavigationDestination(icon: Icon(Icons.person_rounded,color: Colors.deepOrangeAccent,), label: 'Profile'),
                ],



              ),
            )

        ),
      ),
    );

  }

}



