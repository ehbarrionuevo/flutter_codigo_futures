
import 'package:flutter/material.dart';
import 'package:flutter_codigo_futures/data/data_future.dart';

class GeneralPage extends StatefulWidget {
  @override
  State<GeneralPage> createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {

  DataFuture _dataFuture = DataFuture();

  List<Map<String, dynamic>> people = [];

  @override
  initState(){
    super.initState();
    getData();
  }

  getData(){
    _dataFuture.getDataList().then((value) {
      people = value;
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Integrantes",),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.redAccent,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.indigo,
              child: ListView.builder(
                itemCount: people.length,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text(people[index]["fullName"]),
                    subtitle: Text(people[index]["address"]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
