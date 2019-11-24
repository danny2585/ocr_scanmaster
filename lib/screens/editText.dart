import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:ocr_scan_master/back_screens/save.dart';

class TextEdit extends StatefulWidget {
  final OcrText ocrText;

  TextEdit(this.ocrText);
  @override
  _TextEditState createState() => new _TextEditState(this.ocrText);
 }
class _TextEditState extends State<TextEdit> {
  final OcrText ocrText;
  _TextEditState(this.ocrText);
  String result = "";

  @override
  void initState() {
    super.initState();
    result = ocrText.value.splitMapJoin("/n");;
  }

  @override
  Widget build(BuildContext context) {
    var bodyText = widget.ocrText.value.splitMapJoin("/n");
    //theme:  new ThemeData.light();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edición"),
        actions: <Widget>[
         new IconButton(////////////////////////////////////// Buton Save
           icon: new Icon(Icons.save, color: Colors.white,),
           onPressed: () {
              print("TEXTO MAS CADENA ESCRITA: "+result);
             Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaveText(storage:  TextStorage(), storagel:  CounterStorage(), resultToSave: result,)),
              );
           },
         ),
       ],
      //  backgroundColor: Colors.grey[900],
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
            initialValue: bodyText,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            
            onChanged: (String value){
              setState(() {
                result = value;
              });
            },

            // onSaved: (input) => setState(() {
            //   bodyText = input;
            // }),
            // validator: (String value) {
            //   return value.contains('@') ? 'Do not use the @ char.' : null;
            // },
          )
        ]  
      ),
    ),
   );
  }
}