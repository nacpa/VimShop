import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fetchData extends StatelessWidget {
  const fetchData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db=FirebaseFirestore.instance.collection("Product1").snapshots();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fetch"),
        ),
        body:StreamBuilder(stream: db,builder: (context ,snapshot){
          if(snapshot.hasData){
 return  Center(
              child: Container(
                margin: EdgeInsets.all(10),
                height: 300,
                width: double.maxFinite,
                decoration:
                BoxDecoration(border: Border.all(width: 3, color: Colors.black)),child: Text(''),
              ));}else{return Container();}

        },)
      ),
    );
  }
}
