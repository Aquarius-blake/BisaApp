


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class PharmacyDrugs extends StatefulWidget {
  final String? pharmacyname;
  const PharmacyDrugs({super.key, this.pharmacyname});

  @override
  State<PharmacyDrugs> createState() => _PharmacyDrugsState();
}

class _PharmacyDrugsState extends State<PharmacyDrugs> {

  bool isloading = true;


  List drugs = [
    'Drug A',
    'Drug B',
    'Drug C',
    'Drug D',
    'Drug E',
    'Drug F',
    'Drug G',
  ];

  List<int?> Selected = [];
  List<int?> quantity = [];

  @override
  void initState() {
    initialize();
    super.initState();
  }

  Future<void> initialize()async{
    try{

      if(mounted){
        setState(() {
          isloading = false;
        });
      }
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            )
          ),
        title: Text(
         widget.pharmacyname ?? 'Pharmacy',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontSize: 20.sp,
          ),
          ),
          actions: [
           Selected.isEmpty ? IconButton(
              onPressed: (){}, 
              icon: const FaIcon(
                FontAwesomeIcons.cartShopping,
                color: Colors.white,
                ),
              ):Badge(
                label: Text(
                  "${Selected.length}",
                  style: TextStyle(
                    color: const Color.fromRGBO(23, 30, 60, 1),
                  ),
                  ),
                offset: const Offset(0, 0),
                backgroundColor: Color(0xFFB5E255),
                child: IconButton(
                onPressed: (){}, 
                icon: const FaIcon(
                  FontAwesomeIcons.cartShopping,
                  color: Colors.white,
                  ),
                ),
              )
          ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal:20,
          vertical: 10
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height*0.85,
              padding: const EdgeInsets.only(
                top: 30,
              ),
              child: WaterfallFlow.builder(
                itemCount: 5,
                gridDelegate: const SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 30.0,
                          ), 
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(
                    vertical:10,
                    horizontal: 10
                    ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                     boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: const Color(0xFFB5E255).withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: index % 2 == 0? const Offset(2, 3):const Offset(-2, 3), 
                         // offset:  Offset(2, 1), 
                        )
                      ]
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMTBEAlg102mxxp916OYttXF2kPStrVMruEQ&s')
                          )
                        ),
                        child: const Text(""),
                      ),
                      Text(
                        "${drugs[index]}"
                        ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
                            Text("0"),
                             IconButton(onPressed: (){}, icon: Icon(Icons.add))
                          ],
                        ),
                      )
                    ],
                  ),
                )
                ),
            )
          ],
        ),
      ),
      floatingActionButton:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: (){
           
              //  ScaffoldMessenger.of(context).showSnackBar(
              //                  const  SnackBar(
              //                     content:  Text("Cycle saved successfully"),
              //                     duration:  Duration(seconds: 3),
              //                     backgroundColor: Colors.pink,
              //                   )
              //           );
              //   Future.delayed(const Duration(seconds: 3),(){
              //     Navigator.pop(context);
              //   });
            },
            child: Container(
                        height: 50,
                        width: 200,
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left:30
                          ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xFFB5E255),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset:  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20.sp,
                              color:  Colors.black,
                            ),
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}