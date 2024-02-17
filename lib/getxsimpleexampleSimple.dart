// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Home(),
//     );
//   }
// }
//
// class Home extends StatelessWidget {
//   final count = 0.obs;
//   List<String> randomNames = [
//     'Emily',
//     'Alex',
//     'Jasmine',
//     'Brandon',
//     'Sophia',
//     'Marcus',
//     'Isabella',
//     'Jordan',
//     'Olivia',
//     'Carter',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     print("build");
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("Getx State Management"),
//       ),
//       body: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Obx(() => Column(children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     count.value = 0;
//                     print(count.value);
//                     _saveToPrefs(0);
//                   },
//                   child: Container(
//                     width: 150,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: count.value == 0 ? Colors.green : Colors.white,
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "HOME",
//                         style: TextStyle(
//                           fontFamily: 'Raleway',
//                           fontSize: 15,
//                           color: count.value == 0
//                               ? Colors.white
//                               : Colors.black,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     count.value = 1;
//                     print(count.value);
//                     _saveToPrefs(1);
//                   },
//                   child: Container(
//                     width: 150,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: count.value == 1 ? Colors.green : Colors.white,
//                       borderRadius: BorderRadius.circular(15.0),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "CHANNELS",
//                         style: TextStyle(
//                             fontFamily: 'Raleway',
//                             fontSize: 15,
//                             color: count.value == 1
//                                 ? Colors.white
//                                 : Colors.black),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Builder(
//               builder: (context) {
//                 if (count.value == 0) {
//                   return ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: 10,
//                     itemBuilder: (context, index) {
//                       return Padding(
//                         padding: EdgeInsets.all(8),
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             radius: 30,
//                             backgroundColor: Colors.blue,
//                             backgroundImage: NetworkImage(
//                                 'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D'),
//                           ),
//                           title: Text(randomNames[index]),
//                           subtitle: Text(
//                               'Hey i am Abubakar Asif-Full Stack Flutter App Developer.'),
//                           trailing:
//                           Text('${DateTime.now()}'.substring(0, 10)),
//                           onTap: () {
//                             // Add your onTap logic here
//                           },
//                         ),
//                       );
//                     },
//                   );
//                 } else {
//                   return Padding(
//                     padding: EdgeInsets.all(5),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         ListView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: 2,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: EdgeInsets.all(8),
//                               child: ListTile(
//                                 leading: CircleAvatar(
//                                   radius: 30,
//                                   backgroundImage: NetworkImage(
//                                       'https://yt3.googleusercontent.com/3K6h6gpMPf4mK9qh6SXTl0W3PLxnOMzUnFHc2lbS9t-ucS-b4JGcR8nW7ja9XDYkHM-kAnijk2c=s900-c-k-c0x00ffffff-no-rj'),
//                                 ),
//                                 title: Text(
//                                     "ICC-International Cricket Council"),
//                                 subtitle: Text(
//                                     'Hey i am Abubakar Asif-Full Stack Flutter App Developer.'),
//                                 onTap: () {
//                                   // Add your onTap logic here
//                                 },
//                               ),
//                             );
//                           },
//                         ),
//                         Text(
//                           "Discover Channels",
//                           style: TextStyle(
//                               fontFamily: 'Raleway',
//                               fontSize: 15,
//                               color: Colors.grey),
//                         ),
//                         ListView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: 10,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: EdgeInsets.all(3),
//                               child: ListTile(
//                                 leading: CircleAvatar(
//                                     radius: 30,
//                                     backgroundColor: Colors.blue,
//                                     backgroundImage: NetworkImage(
//                                         'https://vectorseek.com/wp-content/uploads/2023/06/Asia-Cup-2023-Logo-Vector.jpg')),
//                                 title: Text("ACC-Asian Cricket Council"),
//                                 subtitle: Text(
//                                     'Hey i am Abubakar Asif-Full Stack Flutter App Developer.'),
//                                 trailing: Text('Tap to Join'),
//                                 onTap: () {
//                                   // Add your onTap logic here
//                                 },
//                               ),
//                             );
//                           },
//                         )
//                       ],
//                     ),
//                   );
//                 }
//               },
//             ),
//           ]))),
//     );
//   }
//
//   void _saveToPrefs(int value) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt('val', value);
//   }
// }
