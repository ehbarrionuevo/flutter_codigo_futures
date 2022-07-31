import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String text = "Hola";

  Future<String> getName() async{
    return "Fiorella de Fátima Gonzales";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Futures"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 30.0
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
              onPressed: () async {

                // getName().then((value){
                //   text = value;
                //   setState((){});
                // });
                text = await getName();
                setState((){});

              },
              child: Text(
                "Mostrar",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
