import 'package:flutter/material.dart';
import 'package:app_productos/splash.dart';
import 'package:app_productos/screens/verProductos.dart';
import 'package:app_productos/screens/insertarProductos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
      routes: <String, WidgetBuilder>{
        "/inicio": (BuildContext context) => MyHomePage(
              title: 'Flutter',
            ),
        "/productosjson": (BuildContext context) => VerProductos(),
        "/insertarproducto": (BuildContext context) => InsertarProducto(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //botones

    final btnVerProductos = new ElevatedButton(
      child: Text("Ver productos"),
      style: ElevatedButton.styleFrom(
          primary: Colors.deepOrange,
          onPrimary: Colors.white,
          elevation: 5,
          shadowColor: Colors.black),
      onPressed: () {
        Navigator.pushNamed(context, "/productosjson");
      },
    );

    final btnInsertarProductos = new ElevatedButton(
      child: Text("Insertar productos"),
      style: ElevatedButton.styleFrom(
          primary: Colors.deepOrange,
          onPrimary: Colors.white,
          elevation: 5,
          shadowColor: Colors.black),
      onPressed: () {
        Navigator.pushNamed(context, "/insertarproducto");
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Pantalla principal'),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Text('Seleccione una opción'),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: btnVerProductos,
                ),
                btnInsertarProductos
              ],
            ),
          ),
        ));
  }
}
