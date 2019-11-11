import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';

class TextEdit extends StatefulWidget {
  final OcrText ocrText;

  TextEdit(this.ocrText);
  @override
  _TextEditState createState() => new _TextEditState(this.ocrText);
 }
class _TextEditState extends State<TextEdit> {
  final OcrText ocrText;
  _TextEditState(this.ocrText);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var picHeight = 260.0;
    var scrollHeight = height - (260.0 + 120.0);
    theme:  new ThemeData.light();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edición"),
      ),
     
    body: new Container(
      padding: const EdgeInsets.all(20.0),
      width: MediaQuery.of(context).size.width,
      
      child: new Stack(
        children: <Widget>[
          // new Container(
          //   child: new Column(children: [
          //     new Container(
          //       color: Colors.white,
          //       margin: new EdgeInsets.only(top: 60.0),
          //       padding: new EdgeInsets.all(7.0),
          //       height: scrollHeight,
          //       child: new ConstrainedBox(
          //         constraints: new BoxConstraints(
          //           minHeight: scrollHeight,
          //           maxHeight: scrollHeight,
          //         ),
          //         child: new SingleChildScrollView(
          //           scrollDirection: Axis.vertical,
          //           reverse: true,
          //           child: new Text("widget.ocrText.value".splitMapJoin("\n"), style: TextStyle(color: Colors.black),),
          //         ),
          //       ),
          //     )
          //   ])
          // ),


          TextFormField(
            decoration: new InputDecoration.collapsed(
              border: InputBorder.none,
              hintText: 'Escribe aqui'
            ),
            initialValue: widget.ocrText.value.splitMapJoin("/n"),
            
            onSaved: (String value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
            },
            // validator: (String value) {
            //   return value.contains('@') ? 'Do not use the @ char.' : null;
            // },
          ),
        ]  
      ),
    ),
   );
  }
}