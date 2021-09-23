import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snap) =>  Scaffold(
        body: StreamBuilder<QuerySnapshot>(stream: FirebaseFirestore.instance.collection("chats/oHqtZHkHhB3ibJ0V0pnd/messages").snapshots() ,
          builder: (context, streamSnapshot) {

            if(streamSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }
            return ListView.builder(itemCount: streamSnapshot.data!.docs.length,itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(8),
                  child:Text(streamSnapshot.data!.docs[index]['text']) ,
                )

            );


          }
          ,),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
          onPressed: () {
          FirebaseFirestore.instance.collection("chats/oHqtZHkHhB3ibJ0V0pnd/messages").snapshots().listen((data) {
            data.docs.forEach((docu) {print(docu['text']); });
          });
          },
        ),
      ),
    );

  }
}

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
