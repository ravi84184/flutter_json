import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new HomePage(),
    ));

class HomePage extends StatefulWidget {
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Joson Demo"),
      ),
      body: new Container(
        child: new Center(
          child: new FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("load_json/person.json"),
            builder: (context, snapshot) {
              // Decode Json
              var myData = json.decode(snapshot.data.toString());
              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child:Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          new Text("Name : " + myData[index]['name']),
                          new Padding(padding: const EdgeInsets.only(top: 2.0)),
                          new Text("Age : " + myData[index]['age']),
                          new Padding(padding: const EdgeInsets.only(top: 2.0)),
                          new Text("Mobile : " + myData[index]['mobile']),
                          new Padding(padding: const EdgeInsets.only(top: 2.0)),
                          new Text("Gender : " + myData[index]['gender']),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
