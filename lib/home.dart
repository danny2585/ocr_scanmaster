import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ocr_scan_master/carousel.dart';
import 'package:ocr_scan_master/provider.dart';
import 'package:ocr_scan_master/screens/acerca_de.dart';

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
        title: new Image(image: new AssetImage('images/Logo.png'),),
      ),

      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: Text('Scan\nMaster'),
            currentAccountPicture: GestureDetector(
              child: new CircleAvatar(
                backgroundImage: AssetImage('images/logo_corto.jpg'),
                
              ),
            ),
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black87,Colors.cyan[200],Colors.grey[350]],
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
              trailing: new Icon(Icons.camera, color: Colors.green[100],),
              onTap: () {
                Navigator.of(context).pop(
                  print("Escanear Documento")
                );
              },
          ),
          new Divider(
            height: 5.0,
          ),
          
          new ListTile(////////////////////////////////////// Boton Abrir DrawerHeader
            title: new Text("Escanear Documento Existente"),
              trailing: new Icon(Icons.file_upload, color: Colors.purple[50],),
                onTap: () {
                Navigator.of(context).pop(
                  print("Escanear Documento Existente")
                );
              },
          ),
          new Divider(
            height: 5.0,
          ),

          new ListTile(////////////////////////////////////// Boton Escanear DrawerHeader
            title: new Text("Historial"),
              trailing: new Icon(Icons.history, color: Colors.grey[400],),
              onTap: () {
                Navigator.of(context).pop(
                  print("Historial")
                );
              },
          ),
          new Divider(
            height: 5.0,
          ),

          new ListTile(////////////////////////////////////// Boton Escanear DrawerHeader
            title: new Text("Ayuda"),
              trailing: new Icon(Icons.help_outline, color: Colors.amber[50],),
              onTap: () {
                Navigator.of(context).pop(
                  print("Ayuda")
                );
              },
          ),
          new Divider(
            height: 5.0,
          ),

          new ListTile(////////////////////////////////////// Boton Acerca De DrawerHeader
            title: new Text("Acerca de:"),
              trailing: new Icon(Icons.info_outline, color: Colors.indigo[50],),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Acerca_de()),
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
      body: new PageView.builder(
        itemBuilder: (context,position){
          imagesPrins = setPantallainicio;
          print("\n\n\n El ancho es de: "+MediaQuery.of(context).size.width.toString()+"\n\n\n");
          return ImageCarousel(imagesPrins, true, false);
        },
        // children: _getMediaList(),
        controller: _pageController,
        onPageChanged: (int index){
          setState(() {
          });
          },
      ),
   );
  }
}