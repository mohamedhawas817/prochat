import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../chat/message_bubbles.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Messages extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>( stream: FirebaseFirestore.instance.collection('chat').orderBy('createdAt', descending: true).snapshots()
        ,
        builder: (context, chatSnapshot) {
      if(chatSnapshot.connectionState == ConnectionState.waiting ) {
       return Center(child: CircularProgressIndicator());
      }
      final chtDocs = chatSnapshot.data.docs;
      return ListView.builder(reverse: true, itemCount:chtDocs.length, itemBuilder: (context, index) => ChatBubble(chtDocs[index]['text'],
        FirebaseAuth.instance.currentUser.uid == chtDocs[index]['userId'],
        key: ValueKey(chtDocs[index].id),
      )
      ,

      );
        });
  }
}
