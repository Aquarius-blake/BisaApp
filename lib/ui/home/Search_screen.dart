
import 'package:bisa_app/models/current_user.dart';
import 'package:bisa_app/providers/current_user_provider.dart';
import 'package:bisa_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
 final CurrentUser currentuser;
  const SearchScreen({super.key, required this.currentuser});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  dynamic searchResponse;
  Map<String,dynamic>? data;
  bool loading=false;
  final TextEditingController _searchcontroller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
 late CurrentUser currentUser;
 late  Future myFuture;
  @override
  void initState() {

    data = ({
      'keyword': "",
      'token': widget.currentuser.token
    });
    myFuture = getSearchresult(data);
    super.initState();
  }

  onSearch(String text,token){

    data = ({
      'keyword': text,
      'token': token
    });
    myFuture = getSearchresult(data);
    setState(() {
      
    });

  //  Future.delayed(Duration(seconds: 5),()async{
  //    searchResponse = await getSearchresult(data).then((value) {
  //     setState(() {
  //       loading = false;
  //     });
  //   });
  //  });

  }


  @override
  Widget build(BuildContext context) {

    currentUser = context.read<CurrentUserProvider>().currentUser!;

    return Scaffold(
     // body: SearchBar(),
     backgroundColor: const Color.fromARGB(255, 228, 228, 228),
     appBar: AppBar(
      backgroundColor: const Color.fromRGBO(23, 30, 60, 1),
      centerTitle: true,
      leading: IconButton(
        onPressed: (){
          Navigator.pop(context);
        },
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
              onPressed: (){
                onSearch(_searchcontroller.text, currentUser.token);
              },
            )
      ],
     ),
     body: Container(
      child: FutureBuilder(
        future: myFuture, 
        builder: ( context , future ){
          if(future.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if(!future.hasData){
            return const Center(
              child: Text("No results available"),
            );
          }else if(future.hasData){
            if(future.data == []){
               return const Center(
              child: Text("No results found"),
            );
            }else{
              print("here is ${future.data}");
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5
                ),
                child: ListView.builder(
                  itemCount: future.data.length,
                  itemBuilder: ( context , index ) => InkWell(
                    onTap: (){
                      switch (future.data[index]['from']) {
                        case 'Articles':
                          print("Goto Article");
                          break;
                        case 'Specialists':
                        print("Goto Specialist");
                        break;
                        case 'FAQs':
                          print("Goto FAQs");
                          break;
                        default:
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text(
                        future.data[index]['title'],
                        style: const TextStyle(
                          fontSize: 20
                        ),
                        ),
                    ),
                  )
                  ),
              );
            }
          }else{
            return const Center(
              child: Text("Oops! Something went wrong"),
            );
          }
        }
        ),
     ),
    // body: Container(
    //   child: Column(
    //     children: [
    //       loading? const Center(
    //         child: CircularProgressIndicator()
    //         ):Container(
    //           padding: const EdgeInsets.symmetric(
    //             vertical: 10,
    //             horizontal: 10,
    //           ),
    //         )
    //     ],
    //   ),
    // ),
    );
  }
}