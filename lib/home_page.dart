import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "Hola";

  @override
  initState() {
    super.initState();
    getData();
    // getName().then((value){
    //   text = value;
    //   setState((){});
    // });
  }

  getData() async {
    text = await getName();
    setState(() {});
  }

  Future<String> getName() async {
    return Future.delayed(Duration(seconds: 3), () {
      return "Ramón";
    });
  }

  Future<List<String>> getProducts() async {
    return Future.delayed(Duration(seconds: 3), () {
      return ["Manzana", "Papaya", "Piña", "Fresa"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Futures"),
      ),
      body: FutureBuilder(
        future: getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // print(snapshot.connectionState);
          // print(snapshot.hasData);
          // print(snapshot.data);
          if (snapshot.hasData) {

           List<String> products = snapshot.data;

            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(products[index]),
                );
              },
            );

          }

          return Center(
            child: CircularProgressIndicator(),
          );

        },
      ),
    );
  }
}
