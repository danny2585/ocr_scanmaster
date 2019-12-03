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
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  void startNewActivity() {
    
    // final Intent intent = new Intent(Intent.)
    //     .setType("plain/text")
    //     .setData(Uri.parse("test@gmail.com"))
    //     .setClassName("com.google.android.gm", "com.google.android.gm.ComposeActivityGmail")
    //     .putExtra(Intent.EXTRA_EMAIL, new String[]{"test@gmail.com"})
    //     .putExtra(Intent.EXTRA_SUBJECT, "test")
    //     .putExtra(Intent.EXTRA_TEXT, "hello. this is a message sent from my demo app :-)");
    // startActivity(intent);
    
    // Intent intent = context.getPackageManager().getLaunchIntentForPackage(packageName);
    // if (intent != null) {
    //     // We found the activity now start the activity
    //     intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    //     context.startActivity(intent);
    // } else {
    //     // Bring user to the market or let them choose an app?
    //     intent = new Intent(Intent.ACTION_VIEW);
    //     intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
    //     intent.setData(Uri.parse("market://details?id=" + packageName));
    //     context.startActivity(intent);
    // }
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
              '\n\nNombre de Paquete:\n'+_packageInfo.packageName+
              '''\n\nDesarrollada por:\nDanny T. Durán & Cristopher A. González

En caso de que errores, incompatibilidad o cualquier otro problema notificarlo a la siguiente dirección de email: ''',
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16.0),
            ),
            new InkWell(
              child: new Text("ocr.scanmaster@gmail.com", 
              style: TextStyle( color: Colors.blue[200], fontSize: 16.0),
              ),
              onTap: () => launch('mailto:ocr.scanmaster@gmail.com'),
          ),
          ],
        ),
      ),
    );
  }
}

