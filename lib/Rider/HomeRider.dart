// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Rider/HistoryRider.dart';
// import 'package:flutter_application_1/Rider/ProfileRider.dart';
// import 'package:get/get.dart';

// class HomeRider extends StatefulWidget {
//   const HomeRider({super.key});

//   @override
//   State<HomeRider> createState() => _HomeRiderState();
// }

// class _HomeRiderState extends State<HomeRider> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 16, top: 16),
//                 child: Text(
//                   "Welcome Rider",
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 300),
//             Center(
//               child: Column(
//                 children: [
//                   Text(
//                     'there are no orders at the moment,',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//                     ),
//                   ),
//                   Text(
//                     'please wait a moment...',
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 383),
//             Container(
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 5, 4, 77),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   topRight: Radius.circular(50),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                    // History Icon and Text with InkWell
//                     InkWell(
//                       onTap: () {
//                         Get.to(() => const HomeRider());
//                       },
//                       child: Column(
//                       children: [
//                         Icon(
//                           Icons.home,
//                           size: 60,
//                           color: Colors.white,
//                         ),
//                         SizedBox(height: 0), // ชิดกับไอคอน
//                         Text(
//                           'Home',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                       ),
//                     ),

//                     // History Icon and Text with InkWell
//                     InkWell(
//                       onTap: () {
//                         Get.to(() => const HistoryRider());
//                       },
//                       child: Column(
//                         children: [
//                           Icon(
//                             Icons.history,
//                             color: Colors.white,
//                             size: 60,
//                           ),
//                           SizedBox(height: 0), // ชิดกับไอคอน
//                           Text(
//                             'History',
//                             style: TextStyle(
//                               color: const Color.fromARGB(255, 246, 246, 246),
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // ProfileRider Icon and Text with InkWell
//                     InkWell(
//                       onTap: () {
//                         Get.to(() => const ProfileRider());
//                       },
//                     child: Column(
//                       children: [
//                         Icon(
//                           Icons.person,
//                           size: 60,
//                           color: Colors.white,
//                         ),
//                         SizedBox(height: 0), // ชิดกับไอคอน
//                         Text(
//                           'Profile',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
