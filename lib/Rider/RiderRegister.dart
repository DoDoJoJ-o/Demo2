import 'package:flutter/material.dart';
import 'package:flutter_application_1/User/UserRegister.dart';
import 'package:flutter_application_1/login.dart';
import 'package:get/get.dart';

class RiderRegister extends StatefulWidget {
  const RiderRegister({super.key});

  @override
  State<RiderRegister> createState() => _RiderRegisterState();
}

class _RiderRegisterState extends State<RiderRegister> {
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
              const SizedBox(height: 20), // ระยะห่างระหว่าง TextField กับไอคอน
              IconButton(
                icon: Icon(Icons.add_a_photo), // เปลี่ยนเป็นไอคอนเพิ่มรูป
                iconSize: 80,
                onPressed: () {
                  // โค้ดสำหรับการถ่ายรูปหรือเลือกภาพจากมือถือ
                  // ตัวอย่างเช่น เปิดกล้องหรือไดอัลล็อกไฟล์
                },
              ),

              
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.start, // เปลี่ยนให้เริ่มต้นที่ซ้าย
                children: [
                  SizedBox(width:132), // ปรับระยะห่างให้เล็กลงระหว่าง 'User' กับ 'Rider'
                  InkWell(
                    onTap: () {
                      Get.to(() => const UserRegister());
                    },
                    child: Text(
                      // ให้ Text เป็น child ของ InkWell
                      'User',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width:75), // ปรับระยะห่างให้เล็กลงระหว่าง 'User' กับ 'Rider'
                  Text(
                    'Rider',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                    prefixIcon: Icon(Icons.person),
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
                    prefixIcon: Icon(Icons.delivery_dining),
                    hintText: ' License Plate',
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
