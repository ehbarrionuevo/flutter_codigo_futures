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
  initState() {
    super.initState();
    getData();
  }

  getData() {
    _dataFuture.getDataList().then((value) {
      people = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2d2d2d),
      appBar: AppBar(
        title: Text(
          "Integrantes",
        ),
      ),
      body: Column(
        children: [
          const Text(
            "Gestionar datos",
            style: TextStyle(
              color: Colors.white,
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Nombre completo",
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 12.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Nombre completo",
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                EdgeInsets.symmetric(vertical: 10, horizontal: 12.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),

          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 14.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34.0),
                  topRight: Radius.circular(34.0),
                ),
              ),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: people.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(people[index]["fullName"]),
                    subtitle: Text(people[index]["address"]),
                    // trailing: Row(
                    //   mainAxisSize: MainAxisSize.min,
                    //   children: [
                    //     IconButton(onPressed: (){}, icon: Icon(Icons.edit),),
                    //     ElevatedButton(onPressed: (){}, child: Text("Enviar"))
                    //   ],
                    // ),
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
