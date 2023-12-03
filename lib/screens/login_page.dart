import 'package:catalogue_app/screens/navigation.dart';
import 'package:flutter/material.dart';
import 'package:catalogue_app/screens/signup_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F3EA),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(35.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome!",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "Sign In to continue",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: 'Username or Phone Number',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  obscureText: _obscureText,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // You can add more validation if needed
                    return null;
                  },
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffA29B30)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xffF6F3EA),
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Color(0xffA29B30),
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
