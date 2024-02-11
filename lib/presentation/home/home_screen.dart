import 'package:ecomm/presentation/home/category_screen.dart';
import 'package:ecomm/presentation/home/profile_screen.dart';
import 'package:ecomm/presentation/home/user_feed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  static const String routeName = 'HomeScreen';
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = const [
    UserFeedScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce App"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Badge(child: const Icon(CupertinoIcons.cart_fill))),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          //hm bloc aur provider use karee for state management
          //toh fir setState ka use kyu kia???
          //kyuki jo pages h like home,cart,userfeed,profile wo rebuild honi he h
          //toh kyu kam badhana apna. direct setState use karlo
          //lekin jo in screen me data feed hoga usme hm use karenmge bloc,provider
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
