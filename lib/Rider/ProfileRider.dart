import 'package:flutter/material.dart';

class ProfileRider extends StatefulWidget {
  const ProfileRider({super.key});

  @override
  State<ProfileRider> createState() => _ProfileRiderState();
}

class _ProfileRiderState extends State<ProfileRider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // เปลี่ยนสีพื้นหลังที่นี่
      backgroundColor: const Color.fromARGB(255, 201, 205, 207), // ตั้งค่าพื้นหลังเป็นสีฟ้าอ่อน
      appBar: AppBar(
        title: Text(""),
      ),
      body: Center(
        // ใช้ Center เพื่อจัดให้อยู่กลางทั้งแนวนอน
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.start, // จัดแนวกลางในแนวแกนหลัก (แนวตั้ง)
            crossAxisAlignment:
                CrossAxisAlignment.center, // จัดแนวกลางในแนวแกนรอง (แนวนอน)
            children: [
              //SizedBox(height: 0), // ระยะห่างระหว่าง TextField กับไอคอน
              IconButton(
                icon: Icon(Icons.add_a_photo), // เปลี่ยนเป็นไอคอนเพิ่มรูป
                iconSize: 80,
                onPressed: () {
                  // โค้ดสำหรับการถ่ายรูปหรือเลือกภาพจากมือถือ
                  // ตัวอย่างเช่น เปิดกล้องหรือไดอัลล็อกไฟล์
                },
              ),
              SizedBox(height: 50),
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
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ช่องทางซ้าย
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 22, 143, 20),
                      ),
                      onPressed: () {
                        // Handle button press
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 248, 244, 244),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // เพิ่มระยะห่างระหว่างช่องซ้ายกับขวาเป็น 40
                  // ช่องทางขวา
                  SizedBox(
                    width: 150,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 220, 22, 7),
                      ),
                      onPressed: () {
                        // Handle button press
                      },
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          fontSize: 17,
                          color: Color.fromARGB(255, 248, 244, 244),
                          fontWeight: FontWeight.bold,
                        ),
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
