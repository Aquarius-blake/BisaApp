//  FutureBuilder(
//                 future: null, 
//                 builder: (context, future) {
//                   if(future.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                       )
//                   }else if(!future.hasData){
//                     return const Center(
//                       child: Text("No Data Available"),
//                       );
//                   }else if(){}else{
//                     return const Center(
//                       child: Text("Oops! Something Went Wrong"),
//                       );
//                   }
//                 }
//                 ),