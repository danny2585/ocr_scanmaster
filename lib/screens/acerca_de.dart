import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
import 'package:url_launcher/url_launcher.dart';

class AcercaDe extends StatefulWidget {
  @override
  _AcercaDeState createState() => new _AcercaDeState();
 }
class _AcercaDeState extends State<AcercaDe> {
  var year = new DateTime.now().year;
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    version: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
       title: new Text("Información"),
      ),
      
      body: Stack(
        children: <Widget>[
          Container(                   
            padding: const EdgeInsets.all(20.0),
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/logo_gray.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                new Text(
                  _packageInfo.appName,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
                ),

                new Image(image: AssetImage('images/logo_hd_trans.png'), width: MediaQuery.of(context).size.width / 2, ),
                new Text(
                  "\n\n"+_packageInfo.version+"\n"+year.toString()+"\n",
                  
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle( fontSize: 11.0, fontStyle: FontStyle.italic),
                ),

                new Text(
                  '''Scan Master es una aplicación que utiliza la tecnología OCR (Optical Character Recognition)
    para el escaneo de mapas de bits de documentos fisico para la obtención de uno digital.'''
                  '''\n\nDesarrollada por:\nDanny Durán & Cristopher González

    En caso de que errores o cualquier otro problema notificarlo a la siguiente dirección de email: ''',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16.0),
                ),
                new InkWell(
                  child: new Text(
                    "ocr.scanmaster@gmail.com", 
                    style: TextStyle(
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                      color: Colors.green[700],
                    ),
                  ),
                  onTap: () => launch('mailto:ocr.scanmaster@gmail.com'),
              ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}

