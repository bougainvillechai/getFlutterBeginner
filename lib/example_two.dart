import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {

  List<PhotoModel> photosList = [];

  Future<List<PhotoModel>> getPhotos() async {
    photosList.clear();
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode == 200){
      for(Map i in data){
        PhotoModel photoMod = PhotoModel(title: i['title'], url: i['url'], id: i['id']);
        photosList.add(photoMod);
      }
      return photosList;
    }else{
      return photosList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(future: getPhotos(), builder: (context, AsyncSnapshot<List<PhotoModel>> snapshot){
              if(!snapshot.hasData){
                return Text("Loading!");
              }else{
                return ListView.builder(
                  itemCount: photosList.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading:CircleAvatar(
                        backgroundImage:  NetworkImage(snapshot.data![index].url.toString()),
                      ),
                      title: Text("Notes id:" + snapshot.data![index].id.toString() + " " + snapshot.data![index].title.toString()),
                    );
                });
              }
            }),
          )
        ],
      ),
    );
  }
}

class PhotoModel{
  String title, url;
  num id;
  PhotoModel({
    required this.title, required this.url, required this.id,
  });
}