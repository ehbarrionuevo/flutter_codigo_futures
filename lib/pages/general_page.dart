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
        backgroundColor: Color(0xff2d2d2d),
        title: Text(
          "Integrantes",
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Gestionar datos",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          const SizedBox(
            height: 12.0,
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
                hintText: "Dirección",
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
            margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
            height: 50.0,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.save),
              label: Text(
                "Guardar",
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
              child: people.isNotEmpty
                  ? ListView.builder(
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
                    )
                  : const Center(
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.2,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
