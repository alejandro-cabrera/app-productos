import 'package:flutter/material.dart';
import 'package:app_productos/api/alegraApi.dart';

class VerProductos extends StatefulWidget {
  const VerProductos({Key? Key}) : super(key: Key);

  _VerProductos createState() => _VerProductos();
}

class _VerProductos extends State<VerProductos> {
  late Future<List<Productos>> productosFuture;

  @override
  void initState() {
    super.initState();
    productosFuture = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lectura de archivos JSON'),
        ),
        body: Center(
            child: FutureBuilder<List<Productos>>(
          future: productosFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final productos = snapshot.data!;
              return buildProductos(productos);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )));
  }

  Widget buildProductos(List<Productos> productos) => ListView.builder(
      itemCount: productos == null ? 0 : productos.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 50,
                  child: Image(
                      image: AssetImage("assets/missing-product-img.png")),
                ),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 8),
                        child: Text(
                          productos[index].itemName.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 8),
                        child: Text(productos[index].price.toString()),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        );
      });
}
