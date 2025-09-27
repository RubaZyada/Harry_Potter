import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:harry_potter/data/book_model.dart';
import 'package:harry_potter/data/character_model.dart';
import 'package:http/http.dart' as http;

class Characters extends StatefulWidget {
 const Characters({super.key}); 
  @override
  State<Characters> createState() => _CharactersState();
}
class _CharactersState extends State<Characters> {
  //4- create list of maps
 //8- list of characters
  List<CharacterModel> characters = [];
  //6- call fetch fun in init state
  @override
  void initState() {
     super.initState();
    fetchBooks();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder:  (context, index) {
        final character = characters[index];
        return ListTile(
          // leading: Image.network(book.cover),
          // title: Text(book.title),
          // subtitle: Text(book.description),
        );
      },
    );
  }
   //1- create fetch fun
fetchBooks() async {
  //2- call api (request)
  var response = await http.get(
    Uri.parse('https://potterapi-fedeperin.vercel.app/en/books'),
  );
  //3- decode json
 var data = jsonDecode(response.body);
  //9- 
  data =data.Map((e)=>BookModel.fromJson(e)).toList();
//5- add data to list of maps
setState((){ characters=data;});
  }
//7- create model class
}