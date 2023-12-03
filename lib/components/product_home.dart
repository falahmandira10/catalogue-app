import 'package:catalogue_app/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'package:catalogue_app/data/products.dart';
import 'package:catalogue_app/screens/product_detail.dart';
import 'package:catalogue_app/screens/all_product_page.dart';

class BoxProduct extends StatelessWidget {
  List<ProductCardInfo> amdProduct = ProductCardInfo.getProductAMD();
  List<ProductCardInfo> intelProduct = ProductCardInfo.getProductIntel();
  final String titleSection;
  final bool type;
  BoxProduct({super.key, required this.titleSection, required this.type});

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
                titleSection,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              TextButton(
                child: Text(
                  "Show All",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllProductPage()));
                },
              )
            ],
          ),
        ),
        Container(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Card(
                color: Color(0xFFFFFFFFF),
                surfaceTintColor: Color(0xFFFFFFFFF),
                child: GestureDetector(
                  onTap: () {
                    if (type) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetail(productIndex: index + 15),
                        ),
                      );
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetail(productIndex: index),
                      ),
                    );
                  },
                  child: Container(
                    width: 170,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                      // border: Border.all(color: Colors.black12, width: 1),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            width: double.maxFinite,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: AssetImage(
                                  type
                                      ? intelProduct[index].image
                                      : amdProduct[index].image,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              type
                                  ? intelProduct[index].name
                                  : amdProduct[index].name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              type
                                  ? intelProduct[index].price
                                  : amdProduct[index].price,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
