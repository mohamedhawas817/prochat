import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Messages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>( stream: FirebaseFirestore.instance.collection('chats').snapshots()
        ,
        builder: (context, chatSnapshot) {
      if(chatSnapshot.connectionState == ConnectionState.waiting ) {
       return Center(child: CircularProgressIndicator());
      }
      final chtDocs = chatSnapshot.data.docs;
      return ListView.builder(itemCount:chtDocs.length, itemBuilder: (context, index) => Text(chtDocs[index]['text'])
      ,

      );
        });
  }
}
