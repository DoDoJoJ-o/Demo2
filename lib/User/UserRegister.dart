import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Rider/RiderRegister.dart';
import 'package:flutter_application_1/config/config.dart';
import 'package:flutter_application_1/login.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/model/requset/register.dart';
import 'package:image_picker/image_picker.dart'; // นำเข้าแพ็กเกจ image_picker
import 'package:http/http.dart' as http;


class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  String url = '';
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  
  late XFile? _image; // ตัวแปรสำหรับเก็บภาพที่เลือก

  @override
  void initState() {
    super.initState();
    Configuration.getConfig().then(
      (config) {
        url = config['apiEndpoint'];
      },
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = image; // เก็บภาพที่เลือก
        });
      }
    } catch (e) {
      Get.snackbar('Error', 'ไม่สามารถเลือกภาพได้: $e');
    }
  }

  Future<void> registerUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'รหัสผ่านไม่ตรงกัน');
      return;
    }

    // เตรียมข้อมูลในรูปแบบของ request body
    var requestBody = {
      "phone_number": phoneNumberController.text,
      "name": usernameController.text,
      "user_image": _image?.path != null ? await _uploadImage(_image!.path) : null, // อัปโหลดภาพ
      "address": addressController.text,
      "gps_location": null,
      "user_type": "Sender",
    };

    try {
      var response = await http.post(
        Uri.parse('$url/api/users'), // ตรวจสอบให้แน่ใจว่าได้ดึง API endpoint จาก config อย่างถูกต้อง
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        // จัดการกับการตอบกลับ เช่น แสดงข้อความสำเร็จ
        Get.snackbar('Success', 'สร้างบัญชีสำเร็จ');
        Get.to(() => const Login()); // นำไปยังหน้าเข้าสู่ระบบเมื่อสำเร็จ
      } else {
        // จัดการข้อผิดพลาด เช่น แสดงข้อความผิดพลาด
        Get.snackbar('Error', 'ไม่สามารถสร้างบัญชีได้');
      }
    } catch (error) {
      Get.snackbar('Error', 'เกิดข้อผิดพลาด: $error');
    }
  }

  Future<String?> _uploadImage(String path) async {
    // Implement your image upload logic here
    // คุณอาจใช้บริการหรือ API endpoint ในการอัปโหลดภาพ
    // ส่งคืน URL หรือ path ของภาพที่อัปโหลด
  }

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
                'สร้างบัญชี',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              IconButton(
                icon: Icon(Icons.add_a_photo),
                iconSize: 80,
                onPressed: _pickImage, // เรียกใช้เมธอดเพื่อเลือกภาพ
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 132),
                  Text(
                    'ผู้ใช้',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 75),
                  InkWell(
                    onTap: () {
                      Get.to(() => const RiderRegister());
                    },
                    child: Text(
                      'ไรเดอร์',
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
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    hintText: ' เบอร์โทรศัพท์',
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
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: ' ชื่อผู้ใช้',
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
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: ' รหัสผ่าน',
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
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: ' ยืนยันรหัสผ่าน',
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
                  controller: addressController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.location_on),
                    hintText: ' ที่อยู่',
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
                  onPressed: registerUser,
                  child: const Text(
                    "สร้างบัญชี",
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
                    'ถ้าคุณมีบัญชีอยู่แล้ว ',
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
                      'เข้าสู่ระบบ',
                      style: TextStyle(
                        fontSize: 21,
                        color: const Color.fromARGB(206, 147, 2, 173),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
