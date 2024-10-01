import 'package:flutter/material.dart';
import 'package:flutter_application_1/User/UserRegister.dart';
import 'package:flutter_application_1/Home.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 40),
              Text(
                'By signing in you are agreeing to our',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 0),
              Text(
                '  Terms and Privacy Policy  ',
                style: TextStyle(
                  fontSize: 21,
                  color: Color.fromARGB(255, 47, 139, 50),
                ),
              ),
              SizedBox(height: 55),
              SizedBox(
                width: 360,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: ' Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35),
              SizedBox(
                width: 360,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: ' Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  obscureText: true, // For password field
                ),
              ),
              SizedBox(height: 45),
              SizedBox(
                width: 360,
                height: 60,
                child: FilledButton(
                  onPressed: () {
                    Get.to(() => const Homepage());
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const UserRegister());
                    },
                    child: Text(
                      'Register Now',
                      style: TextStyle(
                        fontSize: 21,
                        color: const Color.fromARGB(206, 147, 2, 173),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
