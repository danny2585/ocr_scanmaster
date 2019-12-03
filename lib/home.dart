import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ocr_scan_master/carousel.dart';
import 'package:ocr_scan_master/provider.dart';
import 'package:ocr_scan_master/screens/acerca_de.dart';
import 'package:ocr_scan_master/screens/ayuda.dart';
// import 'package:ocr_scan_master/screens/gallery.dart';

import 'back_screens/back_camera.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
 }
class _HomeState extends State<Home> {
  @override
  void initState(){
    _pageController = new PageController();
    super.initState();
  }

  @override
  void dispose()
  {
    _pageController.dispose();
    super.dispose();
  }
  PageController _pageController;
  List<dynamic> imagesPrins;
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Scan\nMaster", textAlign: TextAlign.center,)//new Image(image: new AssetImage('images/imgen2.jpg'),),
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text('Scan\nMaster',),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundImage: AssetImage('images/logo_hd_trans.png'),
                
              ),
            ),
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green[900],Colors.green[400],Colors.green[50]],
                stops: [0.0,0.5,0.9],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight
              ),
            ), accountEmail: Text('ocr.scanmaster@gmail.com'),
          ),
          // new Container(
          //   child: new DrawerHeader(child: new CircleAvatar(child: Icon(Icons.camera, size: 100.0, color: Colors.amber,), radius: 50.0,)), 
          //   color: Colors.grey,
          // ),

          new ListTile(////////////////////////////////////// Boton Escanear DrawerHeader
            title: new Text("Escanear Documento"),
              trailing: new Icon(Icons.camera, color: Colors.green[300],),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BackScreenCamera()),
                );
              },
          ),
          new Divider(
            height: 5.0,
          ),
          
          // new ListTile(////////////////////////////////////// Boton Abrir DrawerHeader
          //   title: new Text("Escanear Documento Existente"),
          //     trailing: new Icon(Icons.file_upload, color: Colors.green[300],),
          //     onTap: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => CameraApp()),
          //       );
          //     },
          // ),
          // new Divider(
          //   height: 5.0,
          // ),

          new ListTile(////////////////////////////////////// Boton Escanear DrawerHeader
            title: new Text("Notas Rapidas"),
              trailing: new Icon(Icons.history, color: Colors.green[300],),
              onTap: () {
                Navigator.of(context).pop(
                  // MaterialPageRoute(builder: (context) => TextEdit())
                );
              },
          ),
          new Divider(
            height: 5.0,
          ),

          new ListTile(////////////////////////////////////// Boton Escanear DrawerHeader
            title: new Text("Ayuda"),
              trailing: new Icon(Icons.help_outline, color: Colors.green[300],),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyStepper()),
                );
              },
          ),
          new Divider(
            height: 5.0,
          ),

          new ListTile(////////////////////////////////////// Boton Acerca De DrawerHeader
            title: new Text("Informacion"),
              trailing: new Icon(Icons.info_outline, color: Colors.green[300],),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AcercaDe()),
                );
              },
          ),
          new Divider(
            height: 5.0,
          ),

          new ListTile(////////////////////////////////////// Boton Cerrar DrawerHeader
            title: new Text("Cerrar"),
              trailing: new Icon(Icons.close, color: Colors.red,),
              onTap: () => SystemNavigator.pop(),
          ),
          ],
        )
      ),
      body: new SingleChildScrollView(
        child: Column(
          children: <Widget>[
            
            new ImageCarousel(setPantallainicio),
            Divider(
              height: 10.0,
            ),
            new Center(
              child: Image.asset(
                'images/anuncio.png',
                width: MediaQuery.of(context).size.width / 1.3,
                height: 80,
              ),
            )
            // new FloatComercial(),

          ]),
      ),
   );
  }
}