import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Map<String, dynamic>> allProducts = [
    {"id": 1, "name": "Intel Core i3 gen 13", "type": "CPU"},
    {"id": 2, "name": "Intel Core i5 gen 13", "type": "CPU"},
    {"id": 3, "name": "Intel Core i7 gen 12", "type": "CPU"},
    {"id": 4, "name": "Intel Core i3 gen 10", "type": "CPU"},
    {"id": 5, "name": "Intel Core i5 gen 11", "type": "CPU"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
          title: Align(
            alignment: Alignment(-0.28, 0),
            child: Text(
              "Desklyn",
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Search...",
                    suffixIcon: Icon(Icons.search_rounded),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: allProducts.length,
                  itemBuilder: (context, index) => Card(
                    key: ValueKey(allProducts[index]['id']),
                    color: Colors.blueAccent,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Text(
                        allProducts[index]['id'].toString(),
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                      title: Text(
                        allProducts[index]['name'],
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${allProducts[index]['type'].toString()}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
