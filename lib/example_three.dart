import 'dart:convert';

import 'package:apitutorials/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {

  List<UserModel> users = [];


  Future<List<UserModel>> getUsers() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      users.clear();
      for(Map i in data){
        users.add(UserModel.fromJson(i));
      }
      return users;
    }else{
      return users;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complex Get API", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getUsers(), builder: (context, AsyncSnapshot<List<UserModel>> snapshot){
              
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index){
                  final userr = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(userr.id.toString()),
                              Text(userr.username.toString()),
                            ],
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(userr.name.toString()),
                              Text(userr.company.toString()),
                            ],
                          ),
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(userr.name.toString()),
                               Text(userr.address!.city.toString()),
                            ],
                          ),
                          ],
                        
                      ),
                      
                    ),
                  );
              });
            }),
          )
        ],
      ),
    );
  }
}