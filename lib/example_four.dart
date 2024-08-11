import 'dart:convert';

import 'package:apitutorials/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EaxmpleFour extends StatefulWidget {
  const EaxmpleFour({super.key});

  @override
  State<EaxmpleFour> createState() => _EaxmpleFourState();
}

class _EaxmpleFourState extends State<EaxmpleFour> {
  var data;
  Future<void> getUser() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Without Model API"),),
      body: FutureBuilder(
          future: getUser(),
          builder: (context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading');
            } else {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index){
                return ReUseableWidget(user: data[index]["name"], name: data[index]["email"]);
              });
            }
          }),
    );
  }
}


class ReUseableWidget extends StatelessWidget {
  String user, name;
  ReUseableWidget({super.key, required this.user, required this.name});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(user),
          Text(name)
        ],
      ),
    );
  }
}