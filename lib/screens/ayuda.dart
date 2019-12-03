import 'package:flutter/material.dart';
import 'package:ocr_scan_master/provider.dart';

void main() {
  runApp(new MaterialApp(
   home: MyStepper(),
  ));
}

class MyStepper extends StatefulWidget {
  @override
  _MyStepperState createState() => new _MyStepperState();
 }
class _MyStepperState extends State<MyStepper> {
  
  int _currentStep = 0;
  List<Step> mySteps = [
    new Step(
      title: new Text("Paso 1"),
      subtitle: new Text('Pantalla de inicio',),
      content: new Column(
        children: <Widget>[
          new Image(image: images[0],),
          new Text('''1.	Pulse la opción de menú interactivo, para desplegar las opciones disponibles.'''),
        ],
      )
    ),
    new Step(
      title: new Text("Paso 2"),
      subtitle: new Text("Menú de opciones",),
      content: new Column(
        children: <Widget>[
          new Image(image: images[1],),
          new Text
          ('''1.	Esta opción le permitirá, escanear un documento físico que tenga a disposición.\n\n2.	Le permitirá escribir de forma libre.\n\n3.	Muestra el funcionamiento de la aplicación.\n\n4.	Muestra detalles relacionadas a la aplicación.\n\n5.	Cierra la aplicación.'''),
        ],
      )
    ),
    new Step(
      title: new Text("Paso 3"),
      subtitle: new Text("Escanear documento",),
      content: new Column(
        children: <Widget>[
          new Image(image: images[2],),
          new Text
          ('''1. Intercala entre cámara frontal y cámara trasera\n\n2.	Permite elegir las resoluciones permitidas para la cámara.\n\n3.	Activa/Desactiva el auto enfoque de la cámara.\n\n4.	Activa/Desactiva el flash al momento de usar la cámara.\n\n5.	Activa/Desactiva la devolución de un texto en particular o todo el texto.\n\n6.	Activa/Desactiva retornar el texto pulsando la pantalla.\n\n7.	Activa/Desactiva permite visualizar el texto en pantalla antes de realiza el escaneo.\n\n8.	Comenzar escaneo.'''),
        ],
      )
    ),
    new Step(
      title: new Text("Paso 4"),
      subtitle: new Text("Camara",),
      content: new Column(
        children: <Widget>[
          new Image(image: images[3],),
          new Text('''1. Solo debemos pulsar para realizar el escaneo'''),
        ],
      )
    ),
    new Step(
      title: new Text("Paso 5"),
      subtitle: new Text("Edición",),
      content: new Column(
        children: <Widget>[
          new Image(image: images[4],),
          new Text
          ('''1.	Editar el texto si es necesario.
          2.	Guardar el texto.'''),
        ],
      )
    ),
    new Step(
      title: new Text("Paso 6"),
      subtitle: new Text("Ubicacion del archivo",),
      content: new Column(
        children: <Widget>[
          new Image(image: images[5],),
          new Text('''1.	Muestra la ruta del texto.'''),
        ],
      )
    ),
  ];

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text("Ayuda"),
     ),
     body: new Container(
       child: new Stepper(
         currentStep: this._currentStep,
         steps: mySteps,
         onStepCancel: (){
           setState(() {
             if(_currentStep > 0){
               _currentStep -= 1;
             }
             else{
               _currentStep = 0;
             }
           });
         },
         onStepTapped: (step){
           setState(() {
             _currentStep = step;
           });
         }, 
         onStepContinue: (){
            setState(() {
              if(_currentStep < mySteps.length - 1){
                _currentStep += 1;
              }
              else{
                _currentStep = 0;
              }
            }
          );
         },
       ),
     )
   );
  }
}