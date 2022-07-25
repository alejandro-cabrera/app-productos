import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:app_productos/api/alegraApi.dart';

class InsertarProducto extends StatefulWidget {
  const InsertarProducto({Key? Key}) : super(key: Key);

  _InsertarProducto createState() => _InsertarProducto();
}

class _InsertarProducto extends State<InsertarProducto> {
  TextEditingController nombreController = TextEditingController();
  TextEditingController precioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insertar Producto"),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nombreController,
                    decoration: InputDecoration(labelText: "Nombre"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: precioController,
                    decoration: InputDecoration(labelText: "Precio"),
                    keyboardType: TextInputType.number,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
              child: ElevatedButton(
                child: Text("Insertar Producto"),
                onPressed: () {
                  _insertar();
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _insertar() async {
    final producto = {
      "name": nombreController.text,
      "price": int.parse(precioController.text)
    };
    enviarDatos(json.encode(producto));
  }
}
