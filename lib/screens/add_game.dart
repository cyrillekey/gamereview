// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:gamereview/models/user.dart';
// import 'package:gamereview/screens/home_page.dart';

// class AddGame extends StatefulWidget {
//   final User user;
//   AddGame({Key? key, required this.user}) : super(key: key);

//   @override
//   State<AddGame> createState() => _AddGameState();
// }

// class _AddGameState extends State<AddGame> {
//   double year = 1970.00;
//   FilePickerResult? result;
//   TextEditingController name = TextEditingController();
//   TextEditingController publisher = TextEditingController();
//   TextEditingController review = TextEditingController();
//   bool pressed = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: Text("Add Game"),
//         automaticallyImplyLeading: true,
//         actions: [
//           Center(
//             child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(8),
//           child: Form(
//               child: Column(
//             children: [
//               result != null && result!.files.isNotEmpty
//                   ? Image.file(
//                       File(result!.files[0].path ?? ''),
//                       width: MediaQuery.of(context).size.width,
//                       height: MediaQuery.of(context).size.height * 0.25,
//                       fit: BoxFit.contain,
//                     )
//                   : SizedBox(
//                       height: 10,
//                     ),
//               TextButton(
//                   onPressed: () async {
//                     result = await FilePicker.platform.pickFiles();
//                     setState(() {});
//                   },
//                   child: Text("Pick Image")),
//               SizedBox(
//                 height: 30,
//               ),
//               TextFormField(
//                 controller: name,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                     label: Text("Game Name"),
//                     hintText: 'Enter game name',
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.black))),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: publisher,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                     label: Text("Publisher"),
//                     hintText: 'Enter Publisher Name',
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.black))),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 controller: review,
//                 maxLines: 8,
//                 keyboardType: TextInputType.text,
//                 decoration: InputDecoration(
//                     label: Text("Description"),
//                     hintText: 'Description',
//                     border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.black),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.black))),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Center(
//                 child: Text("Release Year"),
//               ),
//               Slider(
//                 min: 1970,
//                 max: (DateTime.now().year).toDouble(),
//                 value: year,
//                 divisions: ((DateTime.now().year) - 1970),
//                 onChanged: (value) {
//                   print(value);
//                   setState(() {
//                     year = value;
//                   });
//                 },
//                 activeColor: Colors.pink,
//                 label: year.toInt().toString(),
//                 inactiveColor: Colors.blue,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextButton.icon(
//                   style: ButtonStyle(
//                       fixedSize: MaterialStateProperty.all<Size>(Size(180, 60)),
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(Colors.red)),
//                   onPressed: () {
//                     setState(() {
//                       pressed = !pressed;
//                     });
//                     print(widget.user.user_id);
//                     // saveGame();
//                   },
//                   icon: Icon(
//                     Icons.save,
//                     color: Colors.white,
//                   ),
//                   label: !pressed
//                       ? Text(
//                           "Save Game",
//                           style: TextStyle(color: Colors.white),
//                         )
//                       : CircularProgressIndicator(
//                           color: Colors.white,
//                         ))
//             ],
//           )),
//         ),
//       ),
//     );
//   }

//   Future<void> saveGame() async {
//     final dio = Dio();
//     await dio
//         .get(
//             "https://scaletoday-heliumharbor-8080.codio-box.uk/${widget.user.user_id}/${name.text}/${publisher.text}/4.5/${review.text}/$year/hrrr")
//         .then((value) {
//       if (value.statusCode == 200) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => HomePage()));
//       } else {
//         pressed = !pressed;
//         showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//                   title: Text("Error"),
//                 ));
//       }
//     });
//   }
// }
