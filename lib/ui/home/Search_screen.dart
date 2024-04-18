
import 'package:bisa_app/models/current_user.dart';
import 'package:bisa_app/providers/current_user_provider.dart';
import 'package:bisa_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final FocusNode _focusNode = FocusNode();
 late CurrentUser currentUser;
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

    currentUser = context.read<CurrentUserProvider>().currentUser!;

    return Scaffold(
     // body: SearchBar(),
     appBar: AppBar(
      backgroundColor: const Color.fromRGBO(23, 30, 60, 1),
      centerTitle: true,
      leading: IconButton(
        onPressed: (){},
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.white,
          ),
        ),
      title: TextFormField(
        controller: _searchcontroller,
        focusNode: _focusNode,
        autofocus: true,
        maxLines: 1,
        minLines: 1,
        onChanged: (value) {
          onSearch(value, currentUser.token);
        },
        // style: TextStyle(
        //   fontSize: 12,
        //   height: 0.1
        // ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: "Search for an article, specialist or FAQs",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 4
          )
          // prefixIcon: IconButton(
          //   icon: const Icon(Icons.search),
          //   onPressed: (){},
          // )
        ),
      ),
      actions: [
         IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                ),
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