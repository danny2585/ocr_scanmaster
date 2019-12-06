import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision/flutter_mobile_vision.dart';
import 'package:ocr_scan_master/screens/editText.dart';
import 'package:fluttertoast/fluttertoast.dart';

var allText = "";
// List<String> allText = new List();
class BackScreenCamera extends StatefulWidget {
  @override
  _BackScreenCameraState createState() => new _BackScreenCameraState();
 }
class _BackScreenCameraState extends State<BackScreenCamera> {
  
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  bool _autoFocusOcr = true;
  bool _flashOcr = false;
  bool _multipleOcr = true;
  bool _waitTapOcr = true;
  bool _showTextOcr = true;
  Size _previewOcr;
  List<OcrText> _textsOcr = [];
  bool validador = true;
  
  @override
  void initState() {
    super.initState();
    FlutterMobileVision.start().then((previewSizes) => setState(() {
      // _previewBarcode = previewSizes[_cameraBarcode].first;
      _previewOcr = previewSizes[_cameraOcr].first;
    }));
  }

  @override
  Widget build(BuildContext context) {
   return new MaterialApp(
    theme:  new ThemeData.dark(),
     home: new DefaultTabController(
      length: 1,
      child: new Scaffold(
        appBar: new AppBar(
          bottom: new TabBar(
            indicatorColor: Colors.green[300],
            tabs: [
              //new Tab(text: 'Barcode'),
              new Tab(text: 'OCR'),
            ],
          ),
          backgroundColor: new Color(0),
          title: new Text('Escaner'),
        ),
        body: new TabBarView(children: [
          // _getBarcodeScreen(context),
          _getOcrScreen(context),
        ]),
      ),
    ),
   );
  }

  ///
  /// Scan formats
  ///
  // List<DropdownMenuItem<int>> _getFormats() {
  //   List<DropdownMenuItem<int>> formatItems = [];

  //   Barcode.mapFormat.forEach((key, value) {
  //     formatItems.add(
  //       new DropdownMenuItem(
  //         child: new Text(value),
  //         value: key,
  //       ),
  //     );
  //   });

  //   return formatItems;
  // }

  ///
  /// Camera list
  ///
  List<DropdownMenuItem<int>> _getCameras() {
    List<DropdownMenuItem<int>> cameraItems = [];

    cameraItems.add(new DropdownMenuItem(
      child: new Text('TRACERA'),
      value: FlutterMobileVision.CAMERA_BACK,
    ));

    cameraItems.add(new DropdownMenuItem(
      child: new Text('FRONTAL'),
      value: FlutterMobileVision.CAMERA_FRONT,
    ));

    return cameraItems;
  }

  ///
  /// Preview sizes list
  ///
  List<DropdownMenuItem<Size>> _getPreviewSizes(int facing) {
    List<DropdownMenuItem<Size>> previewItems = [];
    List<Size> sizes = FlutterMobileVision.getPreviewSizes(facing);

    if (sizes != null) {
      sizes.forEach((size) {
        previewItems.add(
          new DropdownMenuItem(
            child: new Text(size.toString()),
            value: size,
          ),
        );
      });
    } else {
      previewItems.add(
        new DropdownMenuItem(
          child: new Text('vacío'),
          value: null,
        ),
      );
    }


    return previewItems;
  }

  ///
  /// OCR Screen
  ///
  Widget _getOcrScreen(BuildContext context) {
    List<Widget> items = [];

    items.add(new Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 18.0,
        right: 18.0,
      ),
      child: const Text('Camara:'),
    ));

    items.add(new Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
      ),
      child: new DropdownButton(
        items: _getCameras(),
        onChanged: (value) {
          _previewOcr = null;
          setState(() => _cameraOcr = value);
        },
        value: _cameraOcr,
      ),
    ));

    items.add(new Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        left: 18.0,
        right: 18.0,
      ),
      child: const Text('Calidad:'),
    ));

    items.add(new Padding(
      padding: const EdgeInsets.only(
        left: 18.0,
        right: 18.0,
      ),
      child: new DropdownButton(
        items: _getPreviewSizes(_cameraOcr),
        onChanged: (value) {
          setState(() => _previewOcr = value);
        },
        value: _previewOcr,
      ),
    ));

    items.add(new SwitchListTile(
      activeColor: Colors.green[300],
      title: const Text('Auto focus:'),
      value: _autoFocusOcr,
      onChanged: (value) => setState(() => _autoFocusOcr = value),
    ));

    items.add(new SwitchListTile(
      activeColor: Colors.green[300],
      title: const Text('Flash:'),
      value: _flashOcr,
      onChanged: (value) => setState(() => _flashOcr = value),
    ));

    items.add(new SwitchListTile(
      activeColor: Colors.green[300],
      title: const Text('Retornar todo el texto:'),
      value: _multipleOcr,
      onChanged: (value) => setState(() => _multipleOcr = value),
    ));

    // items.add(new SwitchListTile(
    //   activeColor: Colors.green[300],
    //   title: const Text('Capturar tocando la pantalla:'),
    //   value: _waitTapOcr,
    //   onChanged: (value) => setState(() => _waitTapOcr = value),
    // ));

    items.add(new SwitchListTile(
      activeColor: Colors.green[300],
      title: const Text('Mostrar texto en pantalla:'),
      value: _showTextOcr,
      onChanged: (value) => setState(() => _showTextOcr = value),
    ));

    items.add(
      new Padding(
        padding: const EdgeInsets.only(
          left: 18.0,
          right: 18.0,
          bottom: 12.0,
        ),
        child: new RaisedButton(
          color: Colors.green[300],
          highlightColor: Colors.green[900],
          onPressed: _read,
          child: new Text('¡ESCANEAR!'),
        ),
      ),
    );

    if (validador) {
      items.addAll(
        ListTile.divideTiles(
          context: context,
          tiles: _textsOcr
            .map(
              (ocrText) => new OcrTextWidget(ocrText),
            )
            .toList(),
        ),
      );
    }
    else{
      Fluttertoast.showToast(
        textColor: Colors.green[300],
        msg: _textsOcr[0].value,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1
      );
    }

    return new ListView(
      padding: const EdgeInsets.only(
        top: 12.0,
      ),
      children: items,
    );
  }

  ///
  /// OCR Method
  ///
  Future<Null> _read() async {
    List<OcrText> texts = [];
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!TEXTO MAS CADENA ESCRITA: "+_cameraOcr.toString());
    try {
      texts = await FlutterMobileVision.read(
        flash: _flashOcr,
        autoFocus: _autoFocusOcr,
        multiple: _multipleOcr,
        waitTap: _waitTapOcr,
        showText: _showTextOcr,
        preview: _previewOcr,
        camera: _cameraOcr,
        fps: 1.0,
      );
      setState(() {
        validador = true;
      });
    } on Exception {
      texts.add(new OcrText('Fallo al reconocer el texto.'));
      setState(() {
        validador = false;
      });
    }

    
    if(validador == true){
      setState(() {
        allText = "";
      });
      for (var x = 0; x < texts.length; x++) {
        for (int i = 0; i < texts.length-x-1; i++) {
          if(texts[i].top > texts[i+1].top){
              var tmp = texts[i+1];
              texts[i+1] = texts[i];
              texts[i] = tmp;
          }
        }
        
      }
      
      texts.map(
        (ocrText) => allText += ocrText.value+"\n\n",
      ).toList();
      setState(() {
        allText = allText;
      });
    }
    else{
      setState(() {
        allText = "";
      });
      allText = texts[0].value;
    }

    if (!mounted) return;
    setState(() => _textsOcr.add(new OcrText(allText)));

  }
  
}

///
/// OcrTextWidget
///
class OcrTextWidget extends StatelessWidget {
  final OcrText ocrText;

  OcrTextWidget(this.ocrText);

  // @override
  // void allvalue(){  
  //   setState(() => allText += ocrText.value);
  // }

  @override
  Widget build(BuildContext context) {

    return new ListTile(
      leading: const Icon(Icons.title),
      title: new Text(ocrText.value),
      subtitle: new Text(ocrText.language),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () => Navigator.of(context).push(
            new MaterialPageRoute(
              builder: (context) => new TextEdit(ocrText.value),
            ),
          ),
    );
  }
}