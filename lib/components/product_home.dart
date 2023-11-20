import 'package:catalogue_app/search_page.dart';
import 'package:flutter/material.dart';

class BoxProduct extends StatelessWidget {
  final int? itemBox;
  final String? titleSection;
  final String? pict;
  final String? nameProduct;
  final String? price;

  const BoxProduct({
    super.key,
    required this.titleSection,
    required this.itemBox,
    required this.pict,
    required this.nameProduct,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleSection!,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  },
                  icon: Icon(Icons.double_arrow_rounded))
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 4 / 5,
            crossAxisCount: 2,
          ),
          itemCount: itemBox,
          shrinkWrap: true,
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey[100],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    offset: Offset(1, 2),
                    blurRadius: 3,
                  )
                ]),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(children: [
              SizedBox(
                height: 30,
              ),
              Image.asset("assets/asus1.jpg"),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Asus ROG Ally",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$5,99",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border_outlined),
                      )
                    ],
                  )
                ],
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
