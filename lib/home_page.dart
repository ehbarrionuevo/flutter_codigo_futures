import 'package:flutter/material.dart';
import 'package:flutter_codigo_futures/data/data_future.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DataFuture dataFuture = DataFuture();

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
        future: dataFuture.getDataList(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if(snap.hasData){
            List<Map<String, dynamic>> people = snap.data;
            return ListView.builder(
              itemCount: people.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(people[index]["fullName"]),
                  subtitle: Text(people[index]["address"]),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
