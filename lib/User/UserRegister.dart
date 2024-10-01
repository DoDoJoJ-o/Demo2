import 'package:flutter/material.dart';
import 'package:flutter_application_1/Rider/RiderRegister.dart';
import 'package:flutter_application_1/login.dart';
import 'package:get/get.dart';

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start, // เริ่มต้นที่ซ้าย
                children: [
                  SizedBox(width: 132), // ระยะห่างจากซ้าย
                  Text(
                    'User',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 75), // เพิ่มระยะห่างระหว่าง 'User' กับ 'Rider'
                  InkWell(
                    onTap: () {
                      Get.to(() => const RiderRegister());
                    },
                    child: Text(
                      // ให้ Text เป็น child ของ InkWell
                      'Rider',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
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
              SizedBox(height: 10),
              SizedBox(
                width: 360,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    //prefixIcon: Icon(Icons.verified_user_sharp),
                    hintText: ' Username',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 360,
                height: 60,
                child: TextField(
                  obscureText: true, // To hide the password input
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: ' Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 360,
                height: 60,
                child: TextField(
                  obscureText: true, // To hide the confirm password input
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: ' Confirm Password',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 360,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                    //prefixIcon: Icon(Icons.location_city),
                    hintText: ' Address',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 360,
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 72, 175, 75),
                  ),
                  onPressed: () {
                    // Handle button press
                  },
                  child: const Text(
                    "CREATE ACCOUNT",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'If you have an account ',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.black,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => const Login());
                    },
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 21,
                        color: const Color.fromARGB(206, 147, 2, 173),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
