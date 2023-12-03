import 'package:catalogue_app/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F5EC),
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Profile",
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
                  child: IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
                onPressed: () {},
              )),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            Image(
              image: AssetImage("assets/desklyn.png"),
              height: 200,
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Color(0xffF8F5EC),
              child: ListTile(
                leading: Icon(Icons.person_pin),
                title: Text("Username"),
                subtitle: Text("User1"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Color(0xffF8F5EC),
              child: ListTile(
                leading: Icon(Icons.phone),
                title: Text("Phone Number"),
                subtitle: Text("083876441320"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              color: Color(0xffF8F5EC),
              child: ListTile(
                leading: Icon(Icons.lock),
                title: Text("Password"),
                subtitle: Text("*******"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red),
                fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 50)),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              },
              child: Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
