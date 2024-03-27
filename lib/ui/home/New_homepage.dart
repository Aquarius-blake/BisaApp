
import 'package:bisa_app/models/current_user.dart';
import 'package:bisa_app/providers/current_user_provider.dart';
import 'package:bisa_app/ui/chat/start_question.dart';
import 'package:bisa_app/ui/home/Fitness/Fitness_splash.dart';
import 'package:bisa_app/ui/home/Water_drinking/Water_home.dart';
import 'package:bisa_app/ui/vaccination/testing_region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewHomePage extends StatefulWidget {
  const NewHomePage({super.key});

  @override
  State<NewHomePage> createState() => _NewHomePageState();
}

class _NewHomePageState extends State<NewHomePage> {
  late CurrentUser currentUser;
  late SharedPreferences prefs;
  String? gender;
  List routes = [
    StartQuestion(),
    FitnessSplash(),
    WaterHome(),
    TestingRegion()
    ];
  List<String?> routename = [
    'Ask a doctor',
    ' Fitness',
    ' Hydration',
    ' Labs'
  ];
  List<String?> routeimage = [
    'assets/imgs/experts1.png',
    'assets/imgs/exercise.png',
    'assets/imgs/hydration.png',
    'assets/imgs/microscope.png'
  ];



  @override
  void initState() {
    initialize();
    super.initState();
  }

initialize()async{
  prefs = await SharedPreferences.getInstance();
  gender = await prefs.getString("gender");
  if(mounted){
    setState(() {
      
    });
  }
}

  
  @override
  Widget build(BuildContext context) {
    currentUser = context.read<CurrentUserProvider>().currentUser!;
    return Scaffold(
      extendBody: true,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
           children:[ 
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              padding: const EdgeInsets.only(
                left:20,
                right: 20,
                top:30,
                bottom: 5
                ),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(23, 30, 60, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                )
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          margin: EdgeInsets.only(
                            right: 10
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            image: DecorationImage(
                              image: AssetImage('assets/imgs/dashpic.png')
                              )
                          ),
                          child: Text(""),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hi, ${currentUser.fname}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp
                                ),
                                ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/imgs/gen.png',
                                    ),
                                 const SizedBox(width: 2,),
                                  Text(
                                  gender ??  "     ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox()
                          ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(23, 30, 60, 1),
                            border: Border(
                              top: BorderSide(
                                color: Colors.white,
                              ),
                              bottom: BorderSide(
                                color: Colors.white
                              ),
                              left: BorderSide(
                                color: Colors.white,
                              ),
                              right: BorderSide(
                                color: Colors.white,
                              )
                            ),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.white,
                            ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: Form(
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 12,
                            height: 0.1
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Search for an article, specialist of FAQs",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            prefixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: (){},
                            )
                            
                          ),
                        ),
                      ),
                    )
                  ]
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10
              ),
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(15),
                  child:  InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageAnimationTransition(
                                      pageAnimationType:
                                          FadeAnimationTransition(),
                                      page: routes[index],
                                    ),
                                  );
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.27,
                                  height: 120.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                         color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: const Offset(2, 3), 
                                      )
                                    ]
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(routeimage[index]!,
                                          height: 55.h, fit: BoxFit.cover),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        ' ${routename[index]}',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                          color: const Color.fromRGBO(
                                              92, 94, 86, 1),
                                        ),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                )
                ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                         const  Text(
                      "Appointment",
                      textAlign: TextAlign.start,
                      style: TextStyle(),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.95,
                        height: 180,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                             BoxShadow(
                                         color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset:  Offset(1, 2), 
                                      )
                          ]
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/imgs/spec.png')
                                    )
                                ),
                                child: Text(""),
                              ),
                              Text(
                                "No appointments today, \nour specialists are waiting to assist",
                                style: TextStyle(
                                  fontSize: 12
                                ),
                                textAlign: TextAlign.center,
                                )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      const  Text(
                      "Engage in an Activity",
                      textAlign: TextAlign.start,
                      style: TextStyle(),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.95,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                             BoxShadow(
                                         color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset:  Offset(1, 2), 
                                      )
                          ]
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(child: Image.asset('assets/imgs/diet2.png'),),
                                        Container(child: Image.asset('assets/imgs/med.png'),),
                                        Container(child: Image.asset('assets/imgs/nutplus.png'),),
                                    
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                    ),
                                  Text(
                                    "Nutrition Guidance",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),
                                    ),
                                    SizedBox(height: 2,),
                                    Text(
                                    "Get the best of nutritional facts and recommendations from health experts",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      height: 0.9
                                    ),
                                    ),
                                ],
                              )
                              ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                            )
                          ],
                        ),
                      ),
                       SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.95,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                             BoxShadow(
                                         color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset:  Offset(1, 2), 
                                      )
                          ]
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(child: Image.asset('assets/imgs/bic.png'),),
                                        Container(child: Image.asset('assets/imgs/walk.png'),),
                                        Container(child: Image.asset('assets/imgs/explus.png'),),
                                    
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                    ),
                                  Text(
                                    "Physical Activities",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),
                                    ),
                                    SizedBox(height: 2,),
                                    Text(
                                    "When it comes to eating right and exercising, there is no \" I\'ll start tomorrow\"",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      height: 1.0
                                    ),
                                    ),
                                ],
                              )
                              ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                            )
                          ],
                        ),
                      ),
                       SizedBox(height: 20,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.95,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                             BoxShadow(
                                         color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset:  Offset(1, 2), 
                                      )
                          ]
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Container(child: Image.asset('assets/imgs/playwell.png'),),
                                        Container(child: Image.asset('assets/imgs/markwell.png'),),
                                        Container(child: Image.asset('assets/imgs/wellplus.png'),),
                                    
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                    ),
                                  Text(
                                    "General Wellness",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),
                                    ),
                                    SizedBox(height: 2,),
                                    Text(
                                    "The groundwork for all happiness is good health",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      height: 0.9
                                    ),
                                    ),
                                ],
                              )
                              ),
                            IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                            )
                          ],
                        ),
                      ),
                ],
              ),
            ),
          SizedBox(
            height: 200,
          )
           ]
          ),
        ),
      ),
    );
  }
}