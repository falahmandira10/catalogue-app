import 'package:catalogue_app/screens/chat1.dart';
import 'package:catalogue_app/screens/home.dart';
import 'package:flutter/material.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  bool isSearchVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF8F5EC),
        leading: InkWell(
          onTap: (){
            Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage()),
                        );
          },
          child: Icon(
            Icons.arrow_back_outlined,
            
          ),
        ),
        title: Text("Chat"),
        bottom: isSearchVisible
            ? PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      hintText: "Search for Product or store",
                      hintStyle: TextStyle(color: Color(0xffA29B30)),
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 18),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon:
                          Icon(Icons.search, color: Color(0xffA29B30)),
                    ),
                  ),
                ),
              )
            : null, // Use null when the search field is not visible
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:12.0),
          child: InkWell(
            onTap: (){
              Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChatScreen()),
                        );
            },
            child: ListView(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
                
                ListTile(
                  contentPadding: EdgeInsets.all(8.0),
                  title: Text("Ninja Detect"),
                  subtitle: Text(
                    "selamat datang di toko kami.kalau ada..",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  leading: CircleAvatar(),
                  trailing: Text("13:00 PM"),
                ),
                Divider(
                  color: Colors.black12,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffA29B30),
        onPressed: () {
          setState(() {
            isSearchVisible = !isSearchVisible;
          });
        },
        child: Icon(Icons.message,
        color: Color(0xffF8F5EC),
        size: 32,),
      ),
    );
  }
}