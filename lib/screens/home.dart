import 'package:carousel_slider/carousel_slider.dart';
import 'package:catalogue_app/components/product_home.dart';
import 'package:catalogue_app/screens/compare_page.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F5EC),
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Desklyn",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Center(
                child: badges.Badge(
                  onTap: () {},
                  badgeContent: Text(
                    "10",
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                  badgeStyle: badges.BadgeStyle(elevation: 2),
                  position: badges.BadgePosition.topEnd(),
                  child: Icon(Icons.favorite, color: Colors.white),
                ),
              ),
            )
          ]),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200,
              viewportFraction: 1,
              aspectRatio: 18 / 9,
              initialPage: 0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 2),
              autoPlayCurve: Curves.fastOutSlowIn,
              // enlargeCenterPage: true,
              // enlargeFactor: 0.5,
              scrollDirection: Axis.horizontal,
            ),
            items: [1, 2, 3].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(color: Colors.amber),
                      child: Image.asset(
                        "assets/slider$i.png",
                        fit: BoxFit.fill,
                      ));
                },
              );
            }).toList(),
          ),
          SizedBox(
            height: 30,
          ),
          BoxProduct(
            titleSection: "Intel Processors",
            type: true,
          ),
          SizedBox(
            height: 10,
          ),
          BoxProduct(
            titleSection: "AMD Processors",
            type: false,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
