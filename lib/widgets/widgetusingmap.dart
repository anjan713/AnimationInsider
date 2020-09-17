// import 'package:flutter/material.dart';
// List<String> exampledata=['Sonu ke tittu','7.8',
// 'Dhoom','7.8',
// 'Dhoom2','8.7',
// 'Dhoom3','7.7',
// 'Bang Bang','8.0',
// 'Zindagi Na Milegi Dobara','9.0',
// 'Krrish','8.7',
// 'Krrish2','8.2',
// 'Krrish3','7.0',

// ];
// class DynamicGenerateUsingMapMethod extends StatefulWidget {
//   @override
//   _DynamicGenerateUsingMapMethodState createState() => _DynamicGenerateUsingMapMethodState();
// }

// class _DynamicGenerateUsingMapMethodState extends State<DynamicGenerateUsingMapMethod> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//     height:300,
//     child: ListView.builder(
//       itemCount: exampledata.length,
//       itemBuilder:(ctx,index){
//         exampledata.map((tx){
//       return Card(
//          color: Colors.deepOrange[400],
//         child:Column(
//           children:<Widget>[
//             Container(
//               child:Text('Movie Name:'+tx,
//               style: TextStyle(
//                 fontWeight:FontWeight.bold,
//                 fontSize: 30,
//               ),),
//             padding: EdgeInsets.all(5),
//             ),
//             Container(
//               child: Text('Movie ratings'+tx,
//               style: TextStyle(
//                 fontWeight:FontWeight.w500,
//                 fontSize: 20,
//               ),),
//             padding: EdgeInsets.all(5),
//             ),
//             ]
//             )
//       );
//         }
//         );

//       }
//         )
//        );
//       }
//           ).toList()
//       ]
//       )

//   }
//   }
