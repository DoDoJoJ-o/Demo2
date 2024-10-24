import 'dart:convert';
import 'dart:io'; // สำหรับจัดการไฟล์ภาพที่ได้จากอุปกรณ์
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Rider/RiderRegister.dart';
import 'package:flutter_application_1/login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart'; // เพิ่มการนำเข้า image_picker

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final String url = 'https://warm-viper-neutral.ngrok.app/api/users';
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  File? _image; // สำหรับเก็บภาพที่ได้จากกล้องหรือคลังภาพ
  final picker = ImagePicker(); // ตัวช่วยในการเลือกหรือถ่ายภาพ

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // เก็บภาพที่เลือก
      });
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  Future<void> registerUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    var requestBody = {
      "phone_number": phoneNumberController.text,
      "name": usernameController.text,
      "user_image": _image?.path ?? "uploads\\default_image.jpg", // ใช้ path ของภาพที่เลือก
      "address": addressController.text,
      "gps_location": null,
      "user_type": "Sender",
    };

    try {
      var response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var jsonResponse = json.decode(response.body);
        Get.snackbar('Success', 'Account created successfully');
        Get.to(() => const Login());
      } else {
        Get.snackbar('Error', 'Failed to create account: ${response.body}');
      }
    } catch (error) {
      Get.snackbar('Error', 'An error occurred: $error');
    }
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
                'Create Account',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              _image == null
                  ? IconButton(
                      icon: Icon(Icons.add_a_photo),
                      iconSize: 80,
                      onPressed: () {
                        _showPicker(context); // เลือกแหล่งที่มาของภาพ
                      },
                    )
                  : Image.file(_image!, height: 150), // แสดงภาพที่เลือก
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 132),
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
              // ส่วนอื่นๆ ของ UI
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.photo_library),
                  title: Text('Choose from gallery'),
                  onTap: () {
                    _pickImage(ImageSource.gallery); // เลือกรูปจากคลังภาพ
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a photo'),
                onTap: () {
                  _pickImage(ImageSource.camera); // ถ่ายรูป
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
