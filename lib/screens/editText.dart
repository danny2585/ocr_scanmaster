import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:ocr_scan_master/back_screens/save.dart';
import 'package:path_provider/path_provider.dart';

class TextEdit extends StatefulWidget {
  String ocrText;

  TextEdit(this.ocrText);
  @override
  _TextEditState createState() => new _TextEditState(this.ocrText);
 }
class _TextEditState extends State<TextEdit> {
  String ocrText;
  _TextEditState(this.ocrText);
  String result = "";
  String ruta;

  @override
  void initState() {
    super.initState();
    print("LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLegue");
    result = ocrText.splitMapJoin("/n");
    showRuta();
  }

  Future<void> showRuta() async{
    final directory = await getExternalStorageDirectory();
    
    setState(() {
      ruta = directory.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bodyText = ocrText.splitMapJoin("/n");
    //theme:  new ThemeData.light();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Edición"),
        actions: <Widget>[
         new IconButton(////////////////////////////////////// Buton Save
           icon: new Icon(Icons.save, color: Colors.white,),
           onPressed: () {

             Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SaveText(storage:  TextStorage(), storagel:  CounterStorage(), resultToSave: result, ruta: ruta,)
                ),
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
          ),
          
        ]  
      ),
    ),
   );
  }
}