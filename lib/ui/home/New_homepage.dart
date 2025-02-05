
import 'dart:math';

import 'package:bisa_app/animation/PageTransition.dart';
import 'package:bisa_app/animation/fade_animation.dart';
import 'package:bisa_app/models/current_user.dart';
import 'package:bisa_app/providers/current_user_provider.dart';
import 'package:bisa_app/services/api_service.dart';
import 'package:bisa_app/ui/chat/start_question.dart';
import 'package:bisa_app/ui/home/FemaleCycle/Cyclehome.dart';
import 'package:bisa_app/ui/home/Fitness/Fitness_splash.dart';
import 'package:bisa_app/ui/home/Home_routes/General.dart';
import 'package:bisa_app/ui/home/Home_routes/Nutri_guide.dart';
import 'package:bisa_app/ui/home/Home_routes/Physic.dart';
import 'package:bisa_app/ui/home/Labs/labs_home.dart';
import 'package:bisa_app/ui/home/Search_screen.dart';
import 'package:bisa_app/ui/home/Specialist/Appointments.dart';
import 'package:bisa_app/ui/home/Specialist/Specialist_home.dart';
import 'package:bisa_app/ui/home/Water_drinking/Water_home.dart';
import 'package:bisa_app/ui/home/babycare/babycare_home.dart';
import 'package:bisa_app/ui/home/dietician/dietician_home.dart';
import 'package:bisa_app/ui/tips/tip_details.dart';
import 'package:bisa_app/ui/tips/tips_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_animation_transition/animations/fade_animation_transition.dart';
import 'package:page_animation_transition/page_animation_transition.dart';
import 'package:page_transition/page_transition.dart';
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
  List Indexcategories=[4,10,12,2,5,3];
  Random random = Random();

  List routes = [
    StartQuestion(),
  CycleHome(), 
   TipsPage(),
    WaterHome(),
    LabsHome(),
    FitnessSplash(),
    Babyhome()
    ];
  List<String?> routename = [
    'Ask a doctor',
   ' Cycle\nTracker',
    ' Emergencies',
    ' Hydration',
    ' Labs',
    ' Fitness',
    'Babies & infants',
  ];
  List<String?> routeimage = [
    'assets/imgs/doc.png',
   'assets/imgs/cyclefem.png',
    'assets/imgs/bandaid.png',
    'assets/imgs/hydration.png',
    'assets/imgs/labo.png',
    'assets/imgs/exercise.png',
    'assets/imgs/baby.png',
    
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

void _getlist(){
  if(gender=='Male'){
     routes = [
    StartQuestion(),
    AppointmentList(),
    TipsPage(),
   // CycleHome(),
    WaterHome(),
    LabsHome(),
    FitnessSplash(),
    Babyhome()
    ];
   routename = [
    'Ask a doctor',
    'Appointment',
    ' Emergencies',
   // ' Cycle\nTracker',
    ' Hydration',
    ' Labs',
    ' Fitness',
    'Babies & infants',
  ];
   routeimage = [
    'assets/imgs/doc.png',
    'assets/imgs/appoint.png',
    'assets/imgs/bandaid.png',
  //  'assets/imgs/femcycle.png',
    'assets/imgs/hydration.png',
    'assets/imgs/labo.png',
    'assets/imgs/exercise.png',
    'assets/imgs/baby.png',
    
  ];
    }else{
      routes = [
    StartQuestion(),
    CycleHome(),
    AppointmentList(),
    TipsPage(),
    WaterHome(),
    LabsHome(),
    FitnessSplash(),
    Babyhome()
    ];
   routename = [
    'Ask a doctor',
    ' Cycle\nTracker',
    'Appointment',
    ' Emergencies',
    ' Hydration',
    ' Labs',
    ' Fitness',
    'Babies & infants',
  ];
   routeimage = [
    'assets/imgs/doc.png',
    'assets/imgs/cyclefem.png',
    'assets/imgs/appoint.png',
    'assets/imgs/bandaid.png',
    'assets/imgs/hydration.png',
    'assets/imgs/labo.png',
    'assets/imgs/exercise.png',
    'assets/imgs/baby.png',
    
  ];
    }
}

  
  @override
  Widget build(BuildContext context) {
    _getlist();
    currentUser = context.read<CurrentUserProvider>().currentUser!;
    //print(currentUser.gender);
    
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   colors: [
        //     Colors.white,
        //     Colors.white,
        //     Color.fromARGB(255, 248, 247, 247),
        //     Color.fromARGB(255, 248, 247, 247),
        //     Color.fromARGB(255, 248, 247, 247),
        //     Color.fromARGB(255, 248, 247, 247),
        //   ]
        //   )
      ),
      child: Scaffold(
       backgroundColor: Color.fromRGBO(245, 245, 245, 1),
      // backgroundColor: Colors.transparent,
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
                     const SizedBox(height: 20,),
                      Container(
                        child: Form(
                          child: TextFormField(
                            onTap: (){
                              PageAnimateNoRep(context, PageTransitionType.bottomToTop, SearchScreen(currentuser: currentUser,));
                            },
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
              // Container(
              //   margin: const EdgeInsets.symmetric(
              //     vertical: 10
              //   ),
              //   height: 150,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 4,
              //     itemBuilder: (context, index) => Container(
              //       margin: const EdgeInsets.all(15),
              //       child:  InkWell(
              //                     onTap: () {
              //                       Navigator.push(
              //                         context,
              //                         PageAnimationTransition(
              //                           pageAnimationType:
              //                               FadeAnimationTransition(),
              //                           page: routes[index],
              //                         ),
              //                       );
              //                     },
              //                     child: Container(
              //                       width:
              //                           MediaQuery.of(context).size.width * 0.27,
              //                       height: 120.h,
              //                       decoration: BoxDecoration(
              //                         color: Colors.white,
              //                         borderRadius: BorderRadius.circular(15),
              //                         boxShadow: [
              //                           BoxShadow(
              //                              color: Colors.grey,
              //                               spreadRadius: 1,
              //                               blurRadius: 2,
              //                               offset: const Offset(2, 3), 
              //                           )
              //                         ]
              //                       ),
              //                       child: Column(
              //                         mainAxisAlignment: MainAxisAlignment.center,
              //                         children: [
              //                           Image.asset(routeimage[index]!,
              //                               height: 55.h, fit: BoxFit.cover),
              //                           SizedBox(
              //                             height: 10.h,
              //                           ),
              //                           Text(
              //                             ' ${routename[index]}',
              //                             style: TextStyle(
              //                               fontFamily: 'Poppins',
              //                               fontWeight: FontWeight.w600,
              //                               fontSize: 14.sp,
              //                               color: const Color.fromRGBO(
              //                                   92, 94, 86, 1),
              //                             ),
              //                             textAlign: TextAlign.center,
              //                           )
              //                         ],
              //                       ),
              //                     ),
              //                   ),
              //     )
              //     ),
              // ),
              Container(
                   margin: const EdgeInsets.symmetric(
                  vertical: 10
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 5
                ),
                height: 150,
                child: ListView.builder(
                  itemCount: routename.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: (){
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
                      width: 140,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0,
                          blurRadius: 8,
                          offset:const Offset(0, 4) 
                         // offset:  Offset(2, 1), 
                        )
                          // BoxShadow(
                          //         color: Colors.grey.withOpacity(0.4),
                          //         spreadRadius: 0,
                          //         blurRadius: 0.2,
                          //         offset: const Offset(1, 2), 
                          //     )
                        ]
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20
                      ),
                      margin:const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 50,
                            child: Image.asset(routeimage[index]!),
                          ),
                          Text(
                            routename[index]!,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
             const SizedBox(height: 20,),
              InkWell(
                onTap: (){
                  PageAnimateNoRep(context, PageTransitionType.fade, DietHome());
                },
                child: Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width*0.99,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 0,
                                  blurRadius: 0.2,
                                  offset: const Offset(1, 2), 
                              )
                    ],
                    image:const DecorationImage(
                      image: AssetImage('assets/imgs/diet3.png'),
                      fit: BoxFit.cover
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left:20,
                      bottom: 10,
                      top: 10
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                      const Text(
                        "How to Eat?",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          height: 1.9
                        ),
                        ),
                       const Text(
                        "Eat to heal, muscle gain\nweight loss, weight gain etc...",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          height: 1.2
                        ),
                        ),
                       Expanded(child: SizedBox()),
                        Container(
                          margin:const EdgeInsets.only(
                            left: 10,
                            bottom: 10
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 5
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow:  [
                               BoxShadow(
                                             //color: Colors.grey.withOpacity(0.3),
                                             color: Color(0xFFB5E255).withOpacity(0.3),
                                              spreadRadius: 1,
                                              blurRadius: 2,
                                              offset: const Offset(-2, -1), 
                                          )
                            ]
                          ),
                          child: const Text(
                            "Discover",
                            style: TextStyle(
                              color: Color(0xFFB5E255),
                              // fontStyle: FontStyle.italic,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              )
                            ),
                        )
                     ],
                    ),
                  ),
                ),
              ),
             const  SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                           const  Text(
                        "Appointments",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(23, 30, 60, 1),
                        ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.95,
                          height: 180,
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow:  [
                               BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 0,
                                  blurRadius: 0.2,
                                  offset: const Offset(1, 2), 
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
                                  decoration:const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/imgs/spec.png')
                                      )
                                  ),
                                  child: Text(""),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(),
                                    Center(
                                      child: Text(
                                        "No appointments today, \nour specialists are waiting to assist",
                                        style: TextStyle(
                                          fontSize: 12
                                        ),
                                        textAlign: TextAlign.center,
                                        ),
                                    ),
                                   // SizedBox(),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: InkWell(
                                          onTap: (){
                                            PageAnimateNoRep(context, PageTransitionType.rightToLeft, SpecialistHome());
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                              right: 10
                                            ),
                                            padding: const EdgeInsets.all(5),
                                            decoration:const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color(0xFFB5E255),
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              color: Colors.white,
                                              ),
                                          ),
                                        ),
                                      )
                                  ],
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
                        InkWell(
                          onTap: (){
                           // PageAnimateNoRep(context, PageTransitionType.fade, NutritionGuide());
                           PageAnimateNoRep(context, PageTransitionType.fade, DietHome());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.95,
                            padding:const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:  [
                                 BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 0,
                                  blurRadius: 0.2,
                                  offset: const Offset(1, 2), 
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
                                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                                )
                              ],
                            ),
                          ),
                        ),
                         SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            PageAnimateNoRep(context, PageTransitionType.fade, Physic());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.95,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:  [
                                 BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 0,
                                  blurRadius: 0.2,
                                  offset: const Offset(1, 2), 
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
                        ),
                         SizedBox(height: 20,),
                        InkWell(
                          onTap: (){
                            PageAnimateNoRep(context, PageTransitionType.fade, GeneralWellnes());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.95,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:  [
                                 BoxShadow(
                                  color: Colors.grey.withOpacity(0.4),
                                  spreadRadius: 0,
                                  blurRadius: 0.2,
                                  offset: const Offset(1, 2), 
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
                        ),
                        SizedBox(height: 40,),
              const  Text(
                        "Health Tips & Articles",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(23, 30, 60, 1),
                        ),
                        ),
                        const SizedBox(height: 40,),
                        Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal:8.0
                                ),
                               // child: buildRandomArticle(5, currentUser),
                              child: buildRandomArticle(4, currentUser),
                            ),
                             Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal:8.0
                                ),
                               // child: buildRandomArticle(5, currentUser),
                              child: buildRandomArticle(10, currentUser),
                            ),
                             Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal:8.0
                                ),
                               // child: buildRandomArticle(5, currentUser),
                              child: buildRandomArticle(12, currentUser),
                            ),
                             Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal:8.0
                                ),
                               // child: buildRandomArticle(5, currentUser),
                              child: buildRandomArticle(2, currentUser),
                            ),
                             Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal:8.0
                                ),
                               // child: buildRandomArticle(5, currentUser),
                              child: buildRandomArticle(5, currentUser),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal:8.0
                                ),
                               // child: buildRandomArticle(5, currentUser),
                              child: buildRandomArticle(3, currentUser),
                            ),
                            ],
                          )
                        )
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
      ),
    );
  }
}

 FadeAnimation buildRandomArticle(int index,currentUser) {
  Random rand = Random();
    return FadeAnimation(
      1.2,
      -30,
      0,
      FutureBuilder(
          future: getArticles({'id': index, 'token': currentUser.token}),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Sorry, unable to load articles'),
              );
            } else if(snapshot.hasData){ 
              List res = snapshot.data;
              print(res);
              // if(res.length > 1) {
              //   dynamic article = res[rand.nextInt(res.length - 1)];
              // }else{
              //   dynamic article = res[rand.nextInt(res.length)];
              // }
              dynamic article = res[rand.nextInt(res.length)];
              return InkWell(
                onTap: (){
                  PageAnimateNoRep(context, PageTransitionType.fade, TipDetails(article: article));
                },
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(article['image']),
                      fit: BoxFit.cover,
                      )
                  ),
                 child:Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.transparent
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(20),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text(article['category'])
                          ),
                      ),
                      Container(
                        height: 110,
                        width: 200,
                        padding: const  EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 15
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                            colors: [
                              // Colors.transparent,
                              // Colors.transparent,
                              // Colors.transparent,
                              Colors.white.withOpacity(0.1),
                              Colors.white.withOpacity(0.3),
                              Colors.white.withOpacity(0.4),
                              Colors.white.withOpacity(0.5),
                              Colors.white.withOpacity(0.6),
                              Colors.white.withOpacity(0.7),
                              Colors.white.withOpacity(0.8),
                              Colors.white.withOpacity(0.9),
                              Colors.white
                            ]
                            )
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            article['title'],
                            style: TextStyle(
                              fontSize: 20
                            ),
                            ),
                        ),
                      ),
                      ],
                  ),
                 )
                ),
              );
              // return Column(
              //   mainAxisSize: MainAxisSize.min,
              //   children: res.reversed.take(3).map((e) {
              //     var day = DateFormat('EEEE')
              //         .format(
              //           DateTime.parse(e['created_at']),
              //         )
              //         .substring(0, 3);
              //     var num = DateFormat('d').format(
              //       DateTime.parse(e['created_at']),
              //     );

              //     var desc = e['intro'] ??
              //         "This is an awesome article to read. Check it out.";
              //     return InkWell(
              //       onTap: () {
              //         Navigator.push(
              //           context,
              //           PageAnimationTransition(
              //             pageAnimationType: RightToLeftFadedTransition(),
              //             page: TipDetails(
              //               article: e,
              //             ),
              //           ),
              //         );
              //       },
              //       child: Column(
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Container(
              //             height: 100.h,
              //             width: 1.sw - 25.w,
              //             decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(15),
              //                 boxShadow: const [
              //                   BoxShadow(
              //                     color: Color.fromRGBO(0, 0, 0, .21),
              //                     blurRadius: 20,
              //                     offset: Offset(0, 10),
              //                   )
              //                 ]),
              //             child: Row(
              //               children: [
              //                 ClipRRect(
              //                   borderRadius: BorderRadius.circular(15),
              //                   child: SizedBox(
              //                     width: 120.w,
              //                     child: Hero(
              //                       tag: '${e['image']}',
              //                       child: FadeInImage.memoryNetwork(
              //                         placeholder: kTransparentImage,
              //                         image: '${e['image']}',
              //                         fit: BoxFit.cover,
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 12.w,
              //                 ),
              //                 Expanded(
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //                       Text(
              //                         '${e['title']}',
              //                         style: TextStyle(
              //                           fontFamily: 'Poppins',
              //                           fontSize: 16.sp,
              //                           fontWeight: FontWeight.w600,
              //                           // letterSpacing: 2,
              //                           height: 0.99,
              //                           color: const Color.fromRGBO(
              //                               97, 99, 95, 0.98),
              //                         ),
              //                         maxLines: 2,
              //                       ),
              //                       SizedBox(
              //                         height: 5.h,
              //                       ),
              //                       // Html(
              //                       //   data:'${e['content'].split('>')[2]}',
              //                       //   shrinkWrap: true,
              //                       // ),
              //                       Text(
              //                         desc,
              //                         style: TextStyle(
              //                           fontFamily: 'Lato',
              //                           fontSize: 10.sp,
              //                           fontWeight: FontWeight.w400,
              //                           color: const Color.fromRGBO(
              //                               109, 109, 109, 1),
              //                         ),
              //                         maxLines: 2,
              //                         overflow: TextOverflow.ellipsis,
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //                 Container(
              //                   width: 40.w,
              //                   height: 60.h,
              //                   decoration: BoxDecoration(
              //                       color: Colors.white,
              //                       borderRadius: BorderRadius.circular(8),
              //                       boxShadow: const [
              //                         BoxShadow(
              //                           color: Color.fromRGBO(0, 0, 0, .18),
              //                           blurRadius: 20,
              //                           offset: Offset(0, 10),
              //                         )
              //                       ]),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     children: [
              //                       Text(
              //                         day.toUpperCase(),
              //                         style: TextStyle(
              //                           fontFamily: 'Poppins',
              //                           fontSize: 13.sp,
              //                           fontWeight: FontWeight.w400,
              //                           color: const Color.fromRGBO(
              //                               108, 112, 106, 1),
              //                         ),
              //                       ),
              //                       SizedBox(
              //                         height: 3.h,
              //                       ),
              //                       Text(
              //                         num,
              //                         style: TextStyle(
              //                           fontFamily: 'Poppins',
              //                           fontSize: 15.sp,
              //                           fontWeight: FontWeight.w400,
              //                           color: const Color.fromRGBO(
              //                               108, 112, 106, 1),
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 5.w,
              //                 )
              //               ],
              //             ),
              //           ),
              //           SizedBox(height: 10.h)
              //         ],
              //       ),
              //     );
              //   }).toList(),
              // );
            }else{
              return CircularProgressIndicator.adaptive();
            }
          }),
    );
  }