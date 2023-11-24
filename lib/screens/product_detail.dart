import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:catalogue_app/data/products.dart';

class ProductDetail extends StatefulWidget {
  final int productIndex;

  const ProductDetail({required this.productIndex, Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<ProductCardInfo> productData = [];
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    productData = ProductCardInfo.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    ProductCardInfo selectedProduct = productData[widget.productIndex];

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(selectedProduct.image),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buttonArrow(context),
                cart(context),
              ],
            ),
            scroll(),
          ],
        ),
      ),
    );
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color.fromARGB(140, 190, 181, 150),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.arrow_back_outlined,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  cart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color.fromARGB(140, 190, 181, 150),
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(
              Icons.list,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  scroll() {
    ProductCardInfo selectedProduct = productData[widget.productIndex];
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, ScrollController) {
          return SingleChildScrollView(
            controller: ScrollController,
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Color(0xffF8F5EC),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 35,
                            color: Colors.black12,
                          )
                        ],
                      ),
                    ),
                    Text(
                      selectedProduct.name,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w800, height: 1, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star_sharp,
                          color: Color(0xffC9EB00),
                          size: 20,
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Color(0xffC9EB00),
                          size: 20,
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Color(0xffC9EB00),
                          size: 20,
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Color(0xffC9EB00),
                          size: 20,
                        ),
                        Icon(
                          Icons.star_sharp,
                          color: Color(0xffC9EB00),
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          selectedProduct.star,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Colors.black26,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                        )
                      ],
                    ),
                    Text(
                      selectedProduct.rating,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black26,
                          fontWeight: FontWeight.w600,
                          fontSize: 13),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedProduct.price,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  height: 1,
                                  fontSize: 24),
                        ),
                        Container(
                            child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: Color(0xffC9EB00),
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.share,
                              color: Color(0xffC9EB00),
                              size: 30,
                            )
                          ],
                        )),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 234, 227, 204),
                          borderRadius: BorderRadius.circular(18)),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/store.svg'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        selectedProduct.store,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'Online',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black45,
                                                fontSize: 10),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Icon(
                              Icons.chat_bubble,
                              size: 28,
                              color: Color(0xffA29B30),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Specification',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Color(0xffA29B30),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(1.0),
                              1: FlexColumnWidth(1.0),
                            },
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Brand',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.brand,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.transparent,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.transparent,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Warranty Type',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.warranty,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.transparent,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.transparent,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Warranty Duration',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.duration,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.transparent,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.transparent,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Stock',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text("100",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.transparent,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.transparent,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Ships from',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.location,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Product Description',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  color: Color(0xffA29B30),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Table(
                            columnWidths: {
                              0: FlexColumnWidth(1.0),
                              1: FlexColumnWidth(1.0),
                            },
                            children: [
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'SKU',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.sku,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Processor',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.processor,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'CPU Socket Type',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.cpu,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Processors\nGeneration',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.gen,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Family',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.family,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Cores',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.cores,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Threads',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.threads,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Operating\nFrequency',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.operating,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Max Turbo\nFrequency',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.turbo,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Cache',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.cache,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Manufacturing\nTech',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.manufacturing,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Integrated\nGraphics',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.graphics,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Thermal Design\nPower',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.thermal,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                  TableCell(
                                    child: Divider(
                                      color: Colors.black,
                                      thickness: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Container(
                                      child: Text(
                                        'Thermal Solution\n(Cooler)',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black38,
                                                fontSize: 13,
                                                height: 1.2),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Container(
                                      child: Text(selectedProduct.cooler,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87,
                                                  fontSize: 13,
                                                  height: 1.2)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
