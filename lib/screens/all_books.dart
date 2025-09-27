import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:harry_potter/data/book_model.dart';
import 'package:harry_potter/widgets/book_widget.dart';
import 'package:http/http.dart' as http;

class AllBooks extends StatefulWidget {
  const AllBooks({super.key});
  @override
  State<AllBooks> createState() => _AllBooksState();
}

class _AllBooksState extends State<AllBooks> {
   List<BookModel> books = [];
  bool loading = true;
  String? error;
  @override
  void initState() {
    super.initState();
    fetchBooks(); 
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Books'),
      ),
      body:Center(
        child: loading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return BookWidget(model: book);
                },
              ),
      ), 
    );
   
  }
Future<void> fetchBooks() async {
  try {
    final res = await http.get(
      Uri.parse('https://potterapi-fedeperin.vercel.app/en/books'),
    );

    if (res.statusCode != 200) {
      throw Exception('HTTP ${res.statusCode}');
    }

    final List<dynamic> data = jsonDecode(res.body);
    debugPrint('books: ${data.length}');

    final list = data
        .map((e) => BookModel.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    if (!mounted) return;
    setState(() {
      books = list;
      loading = false;
    });
  } catch (e) {
    if (!mounted) return;
    setState(() {
      error = 'Failed to load books: $e';
      loading = false;
    });
  }
}

}




























// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:harry_potter/data/book_model.dart';
// import 'package:http/http.dart' as http;

// class AllBooks extends StatefulWidget {
//  const AllBooks({super.key}); 
//   @override
//   State<AllBooks> createState() => _AllBooksState();
// }
// class _AllBooksState extends State<AllBooks> {
//   //4- create list of maps
//  //8- list of books
//   List<BookModel> books = [];
//   // bool _loading = true;
//   // String? _error;
//   // String _query = '';
//   //6- call fetch fun in init state
//   @override
//   void initState() {
//      super.initState();
//     fetchBooks();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: books.length,
//       itemBuilder:  (context, index) {
//         final book = books[index];
//         return ListTile(
//           leading: Image.network(book.cover),
//           title: Text(book.title),
//           subtitle: Text(book.description),
//         );
//       },
//     );
//   }
 
//    //1- create fetch fun
// fetchBooks() async {
//   //2- call api (request)
//   var response = await http.get(
//     Uri.parse('https://potterapi-fedeperin.vercel.app/en/books'),
//   );
//   //3- decode json
//  var data = jsonDecode(response.body);
//   //9- 
//   data =data.Map((e)=>BookModel.fromJson(e)).toList();
// //5- add data to list of maps
// setState((){ books=data;});
//   }
// //7- create model class
// }


// }
