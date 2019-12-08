import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:url_launcher/url_launcher.dart';
var aunNameDoc;
var direccion;
class TextStorage {
  Future<String> get _externalPath async {
    final directory = await getExternalStorageDirectory();
    String patht = directory.path;
    await Directory('$patht/ScanMaster').create(recursive: true);
    return patht;
  }

  Future<File> get _externelFile async {
    final path = await _externalPath;
    print("//////////////////////////////////////////////////////////////////////////////////auxnamedoc: $aunNameDoc");
    return File('$path/ScanMaster/documento_'+aunNameDoc.toString()+'.doc');
  }

  // Future<String> readText() async {
  //   try {
  //     final file = await _externelFile;

  //     // Leer archivo
  //     String contents = await file.readAsString();

  //     return contents.toString();
  //   } catch (e) {
  //     // Si encuentras un error, regresamos 0
  //     return "nulo";
  //   }
  // }

  Future<File> writeText(String allText) async {
    final file = await _externelFile;

    // Escribir archivo
    return file.writeAsString('$allText');
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/count.txt');
  }

  Future<int> readCounter() async {
    try {
      final file = await _localFile;

      // Leer archivo
      String contents = await file.readAsString();

      return int.parse(contents);
    } catch (e) {
      // Si encuentras un error, regresamos 0
      return 0;
    }
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;

    // Escribir archivo
    return file.writeAsString('$counter');
  }
}

class SaveText extends StatefulWidget {
  final TextStorage storage;
  final CounterStorage storagel;
  String resultToSave;
  String ruta;

  SaveText({Key key, @required this.storage, @required this.storagel, @required this.resultToSave, this.ruta}) : super(key: key);

  @override
  _SaveTextState createState() => _SaveTextState(this.resultToSave, this.ruta);
}

class _SaveTextState extends State<SaveText> {
  String resultToSave;
  String ruta;
  _SaveTextState(this.resultToSave, this.ruta);
  int contador;
  String _url;

  @override
  void initState() {
    super.initState();
    widget.storagel.readCounter().then((int value) {
      setState(() {
         contador = value;
         _url = ruta+"/ScanMaster/Documento_"+contador.toString()+'.doc';
         _almacena();
      });
    });
  }

  void openURL() async{
    print("||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Ruta: "+_url);
    
  }

  void _almacena() {
    setState(() {
      contador++;
      aunNameDoc = contador;
    });
    widget.storagel.writeCounter(contador);
    widget.storage.writeText(resultToSave);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Guardar'),
        actions: <Widget>[
          // new IconButton(////////////////////////////////////// Buton Print
          //   icon: new Icon(Icons.print, color: Colors.white,),
          //   onPressed: () {
          //     //  Navigator.push(
          //     //     context,
          //     //     MaterialPageRoute(builder: (context) => SaveText(storage:  TextStorage(), resultToSave: result,)),
          //     //   );
          //   },
          // ),
        ],       
      ),
      body: Center(
        child: new Column(
          children:<Widget>[
            new Text(
              "Guardado como Documento_"+contador.toString()+"\nRuta: "+ruta+"/ScanMaster",
              textAlign: TextAlign.center,
            ),
            new Divider(
              height: 15.0,
              color: Colors.green[300],
            ),
            // new RaisedButton(
            //   color: Colors.green[300],
            //   child: new Text("???"),
            //   onPressed: openURL,
            // )
          ],
        ),
      ),
    );
  }
}