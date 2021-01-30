import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

var counter = 0;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi segunda app',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  //
  bool pressLike = false;
  bool pressDislike = false;
  DateTime now;
  dynamic datenow = DateFormat.d().add_MMMM().add_y().add_jm().format(DateTime.now());
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  _showSelectionDialogPar(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Par"),
          content: Text("El numero de likes es par"),
          actions: [
            MaterialButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

    _showSelectionDialogImpar(BuildContext context) {
    datenow = DateFormat.d().add_MMMM().add_y().add_jm().format(DateTime.now());
    showDialog(
      context: context,     
      builder: (context) {
        return AlertDialog(
          title: Text("Impar"),
          content: Text(datenow.toString()),
          actions: [
            MaterialButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Info del ITESO'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/iteso.jpg"),
            //Image.network("https://pbs.twimg.com/media/DburBCaVQAAM_2g.jpg"),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Row(
                children: [
                  // textos
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ITESO, Universidad Jesuita de Guadalajara",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text("San Pedro Tlaquepaque"),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.thumb_up, 
                            color: pressLike?Colors.blue:Colors.grey,),
                            onPressed: () {
                              setState(() {
                              pressLike = !pressLike;
                              counter++;       
                              });
                            },
                          ),
                          Text(counter.toString(),),
                          SizedBox(
                            width: 8,
                          ),
                          IconButton(
                            icon: Icon(Icons.thumb_down),
                            color: pressDislike?Colors.red:Colors.grey,
                            onPressed: () {
                              pressDislike = !pressDislike;
                              counter--;
                              setState(() {});
                            },
                          ),
                          
                        ],
                      ),
                    
                    Row(
                      children: [
                              RaisedButton(
                                disabledColor: Colors.amber,
                                child: Text("Info"),
                                splashColor: Colors.amber,
                                color: Colors.blueAccent,
                                onPressed: ()  {
                                  now = DateTime.now();
                                  counter <=0?print("No tiene Likes"):counter % 2 == 0?_showSelectionDialogPar(context):
                                  _showSelectionDialogImpar(context);
                                },
                              ),
                            ],
                          )
                          ],
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                
                children: [
                  Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      IconButton(
                      iconSize: 60,
                                icon: Icon(Icons.mail),
                            onPressed: () {
                              _scaffoldKey.currentState.hideCurrentSnackBar();
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                content: Text("Enviando correo..."))
                              );
                            },
                              ),
                    Text("Correo",textAlign:TextAlign.center,),
                  ],),
                  Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      IconButton(
                      iconSize: 60,
                                icon: Icon(Icons.call),
                            onPressed: () {
                              _scaffoldKey.currentState.hideCurrentSnackBar();
                              _scaffoldKey.currentState.showSnackBar(
                                SnackBar(
                                content: Text("Llamando a ITESO..."))
                              );
                            },
                              ),
                    Text("Llamar"),
                  ],
                  ),
                  Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      IconButton(
                        iconSize: 60,
                        icon: Icon(Icons.directions),
                        onPressed: () {
                          _scaffoldKey.currentState.hideCurrentSnackBar();
                          _scaffoldKey.currentState.showSnackBar(
                            SnackBar(
                              content: Text("Cargando ruta...")
                            )
                          );
                            },
                              ),
                      Text("Ruta"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Text(
                  "El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. Fundada en el año de 1957 por el ingeniero José Fernández del Valle y Ancira, entre otros, la universidad ha tenido una larga trayectoria. A continuación se presenta la historia de la institución en periodos de décadas."),
            ),
          ],
        ),
      ),
    );
  }
}
