import 'dart:convert';
import 'dart:io'; // นำเข้าการใช้งานไฟล์

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

  XFile? _image; // ตัวแปรสำหรับเก็บภาพที่เลือก

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
      "user_image": _image != null ? await _uploadImage(_image!.path) : null, // อัปโหลดภาพ
      "address": addressController.text,
      "gps_location": null,
      "user_type": "Sender",
    };

    try {
      var response = await http.post(
        Uri.parse('$url/api/users'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        Get.snackbar('Success', 'สร้างบัญชีสำเร็จ');
        Get.to(() => const Login());
      } else {
        Get.snackbar('Error', 'ไม่สามารถสร้างบัญชีได้');
      }
    } catch (error) {
      Get.snackbar('Error', 'เกิดข้อผิดพลาด: $error');
    }
  }

  Future<String?> _uploadImage(String path) async {
    try {
      print('Uploading image from path: $path');  // Log path
      var request = http.MultipartRequest('POST', Uri.parse('$url/api/upload'));

      request.files.add(await http.MultipartFile.fromPath('file', path));
      var response = await request.send();
      
      print('Response status code: ${response.statusCode}');  // Log status code
      
      if (response.statusCode == 200) {
        var responseData = await http.Response.fromStream(response);
        print('Response data: ${responseData.body}');  // Log response data
        
        var jsonResponse = json.decode(responseData.body);
        return jsonResponse['fileUrl']; // ส่งคืน URL ของภาพที่อัปโหลดสำเร็จ
      } else {
        print('Upload failed with status: ${response.statusCode}');  // Log failure
        Get.snackbar('Error', 'ไม่สามารถอัปโหลดภาพได้');
        return null;
      }
    } catch (e) {
      print('Error during image upload: $e');  // Log error
      Get.snackbar('Error', 'เกิดข้อผิดพลาดในการอัปโหลดภาพ: $e');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: SingleChildScrollView( // เพื่อให้เลื่อนหน้าจอได้หากเนื้อหาเยอะ
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
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _pickImage,
                  child: _image != null
                      ? Image.file(
                          File(_image!.path),
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        )
                      : Icon(
                          Icons.add_a_photo,
                          size: 80,
                        ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'User',
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
                    controller: phoneNumberController,
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
                    controller: usernameController,
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
                    controller: passwordController,
                    obscureText: true,
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
                    controller: confirmPasswordController,
                    obscureText: true,
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
                    controller: addressController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
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
                    onPressed: registerUser,
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}