import 'dart:convert';

import 'package:apitutorials/models/userModel.dart';
import 'package:apitutorials/models/usersModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFive extends StatefulWidget {
  const ExampleFive({super.key});

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  Future<UsersModel> getUser() async {
    final response = await http.get(Uri.parse("https://webhook.site/941d0e4b-1ccb-4a87-b32c-48d6c45e0262"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      
        return UsersModel.fromJson(data);
      
    } else {
      return UsersModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        FutureBuilder<UsersModel>(future: getUser(), builder: (context, snapshot){
          if(snapshot.hasData){
             return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index){
              return Text(snapshot.data!.data![index].id.toString());
            });
            
          }else{
           return Text("off");
          }
        })
      ],),
    );
  }
}
