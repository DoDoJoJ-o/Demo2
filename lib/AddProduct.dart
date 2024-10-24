import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 320,
                height: 75,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Receiver Phone Number',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: Icon(Icons.search), // ไอคอนค้นหา
                  ),
                ),
              ),
              const SizedBox(height: 20), // ระยะห่างระหว่าง TextField กับไอคอน
              IconButton(
                icon: Icon(Icons.add_a_photo), // เปลี่ยนเป็นไอคอนเพิ่มรูป
                iconSize: 100,
                onPressed: () {
                  // โค้ดสำหรับการถ่ายรูปหรือเลือกภาพจากมือถือ
                  // ตัวอย่างเช่น เปิดกล้องหรือไดอัลล็อกไฟล์
                },
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 320,
                height: 75,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Product Name',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 320,
                height: 150, // เพิ่มความสูงเป็น 150
                child: TextField(
                  decoration: InputDecoration(
                    hintText:
                        'Product Details', // แก้คำผิดจาก Detalls เป็น Details
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  maxLines: null, // อนุญาตให้หลายบรรทัดได้
                  expands: true, // ขยายเต็มพื้นที่ในแนวตั้ง
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 320,
                height: 75,
                child: TextField(
                  decoration: InputDecoration(
                    //hintText: 'Product Name',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                width: 320,
                height: 75,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: ' To',
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 82, 219, 87),
                      ),
                      onPressed: () {
                        // Handle button press
                      },
                      child: const Text(
                        "Send",
                        style: TextStyle(
                          fontSize: 34,
                          color: Color.fromARGB(255, 252, 250, 250),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 50), // ระยะห่างระหว่างปุ่ม
                  Container(
                    width: 60, // ขนาดเส้นผ่าศูนย์กลางของวงกลม
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromARGB(255, 0, 0, 0), // สีขอบวงกลม
                        width: 5, // ความหนาของขอบ
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.close, // เปลี่ยนเป็นกากบาท
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 30,
                      ),
                      onPressed: () {
                        // Handle close button press
                      },
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
