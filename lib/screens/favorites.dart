import 'package:flutter/material.dart';
import 'package:catalogue_app/data/products.dart';
import 'package:catalogue_app/screens/product_detail.dart';

class FavoritePage extends StatefulWidget {
  FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<ProductCardInfo> allProducts = ProductCardInfo.getProduct();

  List<ProductCardInfo> foundProduct = [];

  void _runFilter(String findProduct) {
    List<ProductCardInfo> res = [];
    if (findProduct.isEmpty) {
      res = allProducts;
    } else {
      res = allProducts
          .where((product) =>
              product.name.toLowerCase().contains(findProduct.toLowerCase()))
          .toList();
    }
    setState(() {
      foundProduct = res;
    });
  }

  List<ProductCardInfo> product = [];
  int selectedTabIndex = 0;
  bool isAscending = true;

  ScrollController _scrollController = ScrollController();

  void _getInitialInfo() {
    product = ProductCardInfo.getProduct();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    foundProduct = allProducts;
  }

  FocusNode myFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      backgroundColor: Color(0xffF8F5EC),
      appBar: AppBar(
        backgroundColor: Color(0xffF8F5EC),
        leading: buttonArrow(context),
        title: Text(
          "All Products",
          style: TextStyle(color: Color(0xffA29B30)),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 50,
              child: TextFormField(
                focusNode: myFocus,
                onChanged: (value) => _runFilter(value),
                onTap: () {
                  myFocus.addListener(() {
                    setState(() {});
                  });
                },
                decoration: InputDecoration(
                  hoverColor: Color(0xffA29B30),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: "Search",
                  labelStyle: TextStyle(
                      color:
                          myFocus.hasFocus ? Color(0xffA29B30) : Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffA29B30),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  suffixIcon: Icon(Icons.search_rounded,
                      color:
                          myFocus.hasFocus ? Color(0xffA29B30) : Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildTab("Popular", 0),
                  buildTab("Latest", 1),
                  buildTab("Top Sales", 2),
                  InkWell(
                    onTap: () {
                      setState(() {
                        // Sorting berdasarkan harga
                        isAscending = !isAscending;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(129, 162, 154, 48),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 6),
                        child: Row(
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                color: Color.fromARGB(255, 133, 126, 35),
                              ),
                            ),
                            Icon(
                              isAscending
                                  ? Icons.arrow_upward_sharp
                                  : Icons.arrow_downward_sharp,
                              size: 18,
                              color: Color.fromARGB(255, 133, 126, 35),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.53,
                ),
                itemCount: foundProduct.length,
                itemBuilder: (BuildContext context, int index) {
                  // Key(ValueKey(foundProduct.id));
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetail(
                              productIndex: foundProduct[index].id - 1),
                        ),
                      );
                    },
                    child: ProductCard(foundProduct[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      //button buat scroll balik ke atas
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0.0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(
          Icons.arrow_upward,
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(110, 162, 154, 48),
        elevation: 0,
      ),
    );
  }

  buttonArrow(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back_outlined,
        size: 30,
        color: Color(0xffA29B30),
      ),
    );
  }

  Widget buildTab(String label, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: selectedTabIndex == index
                ? Color(0xffA29B30)
                : Color.fromARGB(129, 162, 154, 48),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          child: Text(
            label,
            style: TextStyle(
              color: Color(0xffF8F5EC),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductCardInfo productInfo;

  ProductCard(this.productInfo);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 254, 252, 238),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(
              productInfo.image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productInfo.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  "${productInfo.price}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.store,
                      size: 16,
                      color: Color.fromARGB(255, 133, 126, 35),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Text(
                        productInfo.store,
                        style: TextStyle(
                            color: Color.fromARGB(255, 133, 126, 35),
                            fontSize: 11,
                            height: 1),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 16,
                      color: Color.fromARGB(255, 133, 126, 35),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: Text(
                        productInfo.location,
                        style: TextStyle(
                            color: Color.fromARGB(255, 133, 126, 35),
                            fontSize: 11,
                            height: 1),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
