

import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

class SpecialistChat extends StatefulWidget {
  const SpecialistChat({super.key});

  @override
  State<SpecialistChat> createState() => _SpecialistChatState();
}

class _SpecialistChatState extends State<SpecialistChat> {
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.only(
        top:0
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
           begin: AlignmentDirectional.topCenter,
           end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Color.fromARGB(255, 247, 245, 245),
            Color.fromARGB(255, 232, 232, 232),
            Color.fromARGB(255, 232, 232, 232)
          ]
          )
      ),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context), 
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              )
            ),
            title: Text('Dr.Specialist'),
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: Icon(
                  Icons.more_vert_outlined
                  )
                )
            ],
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 225, 250, 234),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height-152,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: MessageBar(
                    sendButtonColor:const Color.fromARGB(255, 155, 186, 166),
                    onSend: (value){
                      
                    },
                    actions: [
                      IconButton.outlined(
                        onPressed: ()async{
                          // PageAnimateNoRep(context, PageTransitionType.fade, VideoCall());
                          var options = JitsiMeetingOptions(
                            roomNameOrUrl: "Test_call",
                           // token: "asdjbakdjnkafbibsfaindisbdjfsf"
                            );
                                await JitsiMeetWrapper.joinMeeting(options:options);
                        }, 
                        icon: const Icon(
                          Icons.video_call_outlined
                          )
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}