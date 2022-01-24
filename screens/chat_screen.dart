import 'package:chat_flutter/chat/message.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../chat/new_message.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  @override
  void initState() {
    // TODO: implement initState
    final fbm = FirebaseMessaging.instance;
    FirebaseMessaging.onMessage.listen((msg) {
      print(msg);

    });

    


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snap) =>  Scaffold(
        appBar: AppBar(title: Text("Flutter Chat"),
          actions: [

            DropdownButton(icon: Icon(Icons.more_vert),
              items: [
                DropdownMenuItem(child: Container(child: Row(
                  children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 8,),
                    Text("Logout")
                  ],
                ),
                ),
                  value: 'logout',
                )
              ],
              onChanged: (itemIden) {
              if(itemIden == 'logout') {
                  FirebaseAuth.instance.signOut();
              }
              },
            )
          ],

        ),

        body: Container(child: Column(
            children: [
          Expanded(child: Messages()),
          NewMessage()
        ],),),
        // floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
        //   onPressed: () {
        //
        //   FirebaseFirestore.instance.collection("chats/oHqtZHkHhB3ibJ0V0pnd/messages").add({
        //     "text": "my message to you"
        //   });
        //   // FirebaseFirestore.instance.collection("chats/oHqtZHkHhB3ibJ0V0pnd/messages").snapshots().listen((data) {
        //   //   data.docs.forEach((docu) {print(docu['text']); });
        //   // });
        //   },
        // ),
      ),
    );

  }
}

// StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("chats/oHqtZHkHhB3ibJ0V0pnd/messages").snapshots() ,
// builder: (context, streamSnapshot) {
//
// if(streamSnapshot.connectionState == ConnectionState.waiting) {
// return Center(child: CircularProgressIndicator(),);
// }
// return ListView.builder(itemCount: streamSnapshot.data.docs.length,itemBuilder: (context, index) => Container(
// padding: EdgeInsets.all(8),
// child:Text(streamSnapshot.data.docs[index]['text']) ,
// )
//
// );
//
//
// }
// ,),



//custom app bar
// GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//
// return Scaffold(
// key: _scaffoldKey,
// body: Container(
// height: 160.0,
// child: Stack(
// children: <Widget>[
// Container(
// color: Colors.red,
// width: MediaQuery.of(context).size.width,
// height: 60.0,
// child: Center(
// child: Text(
// "Home",
// style: TextStyle(color: Colors.white, fontSize: 18.0),
// ),
// ),
// ),
// Positioned(
// top: 80.0,
// left: 0.0,
// right: 0.0,
// child: Container(
// padding: EdgeInsets.symmetric(horizontal: 20.0),
// child: DecoratedBox(
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(1.0),
// border: Border.all(
// color: Colors.grey.withOpacity(0.5), width: 1.0),
// color: Colors.white),
// child: Row(
// children: [
// IconButton(
// icon: Icon(
// Icons.menu,
// color: Colors.red,
// ),
// onPressed: () {
// print("your menu action here");
// _scaffoldKey.currentState!.openDrawer();
// },
// ),
// Expanded(
// child: TextField(
// decoration: InputDecoration(
// hintText: "Search",
// ),
// ),
// ),
// IconButton(
// icon: Icon(
// Icons.search,
// color: Colors.red,
// ),
// onPressed: () {
// print("your menu action here");
// },
// ),
// IconButton(
// icon: Icon(
// Icons.notifications,
// color: Colors.red,
// ),
// onPressed: () {
// print("your menu action here");
// },
// ),
// ],
// ),
// ),
// ),
// )
// ],
// ),
// ),
// );
