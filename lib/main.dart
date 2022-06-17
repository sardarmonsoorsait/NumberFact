//import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:number_facts/apis.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputcontroller = TextEditingController();
    final outputcontroller = TextEditingController();
    String _text;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          title: Text('NUMBERSFACTAPP'),
          titleTextStyle: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        keyboardType: TextInputType.number,
                        controller: inputcontroller,
                        decoration: InputDecoration(
                          labelText: 'Enter Number',
                          fillColor: Colors.grey,
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(color: Colors.purple)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                  color: Colors.black87, width: 2.0)),
                        )),
                    const SizedBox(
                      height: 100.0,
                    ),
                    ElevatedButton(
                        onPressed: () async{
                          _text = inputcontroller.text;
                          int num = int.parse(_text);
                        final gdata =await  getNumberFacts(number: num);
                       outputcontroller.text =gdata.text.toString();

                        },
                        child: const Text('submit')),
                    const SizedBox(height: 100.0),
                    TextFormField(
                        controller: outputcontroller,
                        readOnly: true,
                        decoration: InputDecoration(
                          labelText: "Fact is displayed here",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.horizontal(),
                            borderSide: BorderSide(
                              color: Colors.red,
                              width: 2.0,
                            ),
                          ),
                        ))
                  ]),
            ),
          ),
        ));
  }
}
