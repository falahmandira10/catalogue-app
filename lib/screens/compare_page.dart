import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ComparePage extends StatefulWidget {
  const ComparePage({super.key});

  @override
  State<ComparePage> createState() => _ComparePageState();
}

class _ComparePageState extends State<ComparePage> {
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
      body: Center(
        child: Text("Compare Page"),
      ),
    );
  }
}
