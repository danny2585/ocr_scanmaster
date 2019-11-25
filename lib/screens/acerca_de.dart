import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';



class Acerca_de extends StatefulWidget {
  @override
  _Acerca_deState createState() => new _Acerca_deState();
 }
class _Acerca_deState extends State<Acerca_de> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
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
       title: new Text("Acerca De:"),
      ),
      
      body: Container(                   
        padding: const EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/BackGroun.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
          //new Image(image: AssetImage('images/BackGroun.jpg'), ),
            new Text(
              _packageInfo.appName,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0),
            ),
            new Text(
              _packageInfo.version,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle( fontSize: 11.0, fontStyle: FontStyle.italic),
            ),

            new Image(image: AssetImage('images/logo_hd_trans.png'), width: MediaQuery.of(context).size.width / 2, ),

            new Text(
              '\n\nEste es el Nombre de Paquete: '+_packageInfo.packageName+
              '\nNumero de compilación: '+_packageInfo.buildNumber+
              '\n\nDescripción General',
              textAlign: TextAlign.left,
              overflow: TextOverflow.clip,
              style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

