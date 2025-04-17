import 'package:chat_app/constants.dart';
import 'package:chat_app/models/messageModel.dart';
import 'package:chat_app/widgets/appText.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/chatBuble.dart';

class ChatScreen extends StatefulWidget {
   ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
   CollectionReference messages = FirebaseFirestore.instance.collection('messages');

   TextEditingController controller=TextEditingController();

   final _controller=ScrollController();

  @override
  Widget build(BuildContext context) {
   var email= ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt',descending: false).snapshots(),
      builder: (context,snapshot){
         if(snapshot.hasData){
           List<Message> messageList=[];
           for(int i =0 ; i < snapshot.data!.docs.length; i++){
               messageList.add(Message.fromJson(snapshot.data!.docs[i]));
           }
          // print(snapshot.data!.docs[1]['message']);
           return Scaffold(
             backgroundColor: Colors.white,
             appBar: AppBar(
               automaticallyImplyLeading: false,
               backgroundColor: kPrimaryColor,
               title: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Image.asset('assets/images/titleLogo.png',height: 25,width: 25,),
                   SizedBox(width: 10,),
                   appText(text:'ChatBox',fontSize: 18,fontWeight: FontWeight.w400,fontFamily: 'circular',  color: Colors.white,),
                 ],
               ),
               centerTitle: true,
             ),
             body: Column(
               children: [
                 Expanded(
                   child: ListView.builder(
                     controller: _controller,
                     itemCount: messageList.length,
                       itemBuilder: (context,index){

                       return messageList[index].id ==email ? chatBuble(message: messageList[index])
                           :chatBubleForFriend(message: messageList[index]);

                           // chatBuble(
                           //   message: messageList[index],
                           //
                           // );
                       }),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                   child: TextField(
                     controller: controller,
                     onSubmitted: (data){
                       messages.add({
                         'message':data,
                         'createdAt':DateTime.now(),
                         'id' : email
                       });
                       controller.clear();
                       _controller.animateTo(
                         _controller.position.maxScrollExtent,
                         duration: Duration(microseconds: 500),
                         curve: Curves.easeInSine
                          );
                       print(data);
                     },
                     style: TextStyle(
                         fontSize: 16,
                         fontFamily: 'caros',
                         fontWeight: FontWeight.w400
                     ),
                     decoration: InputDecoration(
                         suffixIcon: Icon(
                           Icons.send_sharp,
                           size: 20,
                           color: kPrimaryColor,
                         ),
                         contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 13.0),
                         hintText: 'Send Message',
                         hintStyle: TextStyle(
                             color: Color(0xFF797C7B),
                             fontSize: 14,
                             fontFamily: 'caros',
                             fontWeight: FontWeight.w300
                         ),
                         enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(13),
                             borderSide: BorderSide(
                               width: 1.4,
                               color: kPrimaryColor,
                             )),
                         focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(13),
                             borderSide: BorderSide(
                               width: 1.4,
                               color: kPrimaryColor,
                             )),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(13),
                             borderSide: BorderSide(
                                 color: Colors.white
                             )

                         )
                     ),
                   ),
                 )
               ],
             ),
           );
         }else{
           return Scaffold(
             body: Center(
                 child: appText(text: 'Loading...',fontSize: 25,fontFamily: 'caros',fontWeight: FontWeight.w400,color: kPrimaryColor,)),
           );
         }
      },
    );
  }
}
