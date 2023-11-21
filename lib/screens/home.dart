import 'package:catalogue_app/components/product_home.dart';
import 'package:catalogue_app/screens/compare_page.dart';
import 'package:catalogue_app/screens/profile_page.dart';
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
                    style: TextStyle(fontSize: 10),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 1; i < 4; i++)
                  Image.asset(
                    "assets/asus$i.jpg",
                    height: 200,
                    fit: BoxFit.cover,
                  )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Intel Processors",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BoxProduct(
              titleSection: "CPU",
              itemBox: 5,
              pict: "",
              nameProduct: "",
              price: ""),
          SizedBox(
            height: 10,
          ),
          BoxProduct(
              titleSection: "GPU",
              itemBox: 5,
              pict: "",
              nameProduct: "",
              price: ""),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "AMD Processors",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          BoxProduct(
              titleSection: "CPU",
              itemBox: 5,
              pict: "",
              nameProduct: "",
              price: ""),
          SizedBox(
            height: 10,
          ),
          BoxProduct(
              titleSection: "GPU",
              itemBox: 5,
              pict: "",
              nameProduct: "",
              price: ""),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
