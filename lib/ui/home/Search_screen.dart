
import 'package:bisa_app/services/api_service.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  dynamic searchResponse;
  Map<String,dynamic>? data;
  bool? loading;
  final TextEditingController _searchcontroller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  onSearch(String text,token)async{

    data =({
      'search': text,
      'token': token
    });
    searchResponse = await getSearchresult(data);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // body: SearchBar(),
     appBar: AppBar(
      backgroundColor: const Color.fromRGBO(23, 30, 60, 1),
      leading: IconButton(
        onPressed: (){},
        icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
      title: Container(
        child: TextFormField(
          controller: _searchcontroller,
          focusNode: _focusNode,
          autofocus: true,
          style: TextStyle(
            fontSize: 12,
            height: 0.1
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: "Search for an article, specialist or FAQs",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            // prefixIcon: IconButton(
            //   icon: const Icon(Icons.search),
            //   onPressed: (){},
            // )
          ),
        ),
      ),
      actions: [
         IconButton(
              icon: const Icon(Icons.search),
              onPressed: (){},
            )
      ],
     ),
    body: Container(
      child: Column(
        children: [
          Container()
        ],
      ),
    ),
    );
  }
}