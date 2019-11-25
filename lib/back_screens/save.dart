import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
var aunNameDoc;
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

  SaveText({Key key, @required this.storage, @required this.storagel, @required this.resultToSave}) : super(key: key);

  @override
  _SaveTextState createState() => _SaveTextState(this.resultToSave);
}

class _SaveTextState extends State<SaveText> {
  String resultToSave;
  _SaveTextState(this.resultToSave);
  int contador;
  String _url;

  @override
  void initState() {
    super.initState();
    widget.storagel.readCounter().then((int value) {
      setState(() {
        _url = "";//"file: storage/emulated/0/Android/data/com.example.ocr_scan_master/files/ScanMaster";
         contador = value;
         _almacena();
      });
    });
  }

  void openURL() async{
    print("open click");
    var url = _url;
    print("///////////////////////////el _uri: "+_url);
    if(await canLaunch(url)){
      launch(url);
    }
    else{
      print("/////////////////error de compativilidad "+_url.toString());
    }
  }

  Future<File> _almacena() {
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
          new IconButton(////////////////////////////////////// Buton Print
            icon: new Icon(Icons.print, color: Colors.white,),
            onPressed: () {
              //  Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => SaveText(storage:  TextStorage(), resultToSave: result,)),
              //   );
            },
          ),
        ],       
      ),
      body: Center(
        child: new Column(
          children:<Widget>[
            Text("Guardado como Documento_"+contador.toString(),),
            new Divider(
              height: 15.0,
              color: Colors.green[300],
            ),
            new RaisedButton(
              color: Colors.green[300],
              child: new Text("???"),
              onPressed: openURL,
            )
          ],
        ),
      ),
    );
  }
}