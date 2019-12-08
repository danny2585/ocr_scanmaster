// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class CameraApp extends StatefulWidget {
//   @override
//   _CameraAppState createState() => _CameraAppState();
// }

// class _CameraAppState extends State<CameraApp> {
//   File image;

// //  To use Gallery or File Manager to pick Image
// //  Comment Line No. 19 and uncomment Line number 20
//   picker() async {
//     print('');
//     //File img = await ImagePicker.pickImage(source: ImageSource.camera);
//     File img = await ImagePicker.pickImage(source: ImageSource.gallery);
//     if (img != null) {
//       image = img;
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       theme:  new ThemeData.dark(),
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Escanear Imagen Existente'),
//         ),
//         body: new Container(
//           child: new Center(
//             child: image == null/////////////////////////////
//                 ? new Text('No Image to Show ')/////// enviar la imagen para scan
//                 : new Image.file(image),/////////////////////////////
//           ),
//         ),
//         floatingActionButton: new FloatingActionButton(
//           onPressed: picker,
//           child: new Icon(Icons.image, color: Colors.white,),
//           backgroundColor: Colors.tealAccent[100],
//         ),
//       ),
//     );
//   }
// }