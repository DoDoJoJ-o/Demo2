import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topLeft, // จัดให้ "Welcome" อยู่มุมซ้ายบน
            child: Padding(
              padding: const EdgeInsets.only(left: 16), // เว้นระยะห่าง
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 300), // เว้นระยะห่างระหว่างข้อความ
             Center(
              child: Text(
                'Please press the Add button below to',
                style: TextStyle(
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Text(
                'include the items you wish to ship.',
                style: TextStyle(
                  fontSize: 18,
                  //fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
