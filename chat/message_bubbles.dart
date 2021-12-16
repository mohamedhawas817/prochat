import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {


  ChatBubble(this.message, this.username, this.image_url ,this.isme, {this.key});
  final String message;
  final bool isme;
  // final String userId;
  final String username;
  final String image_url;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [



        Row(
           mainAxisAlignment: isme ? MainAxisAlignment.end :   MainAxisAlignment.start ,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(image_url),
            ),
            Container(
              decoration: BoxDecoration(

                color: isme ? Colors.grey :Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: !isme ? Radius.circular(0) : Radius.circular(12),
                  bottomRight: isme ? Radius.circular(0) : Radius.circular(12)
                ),


              ),
              width: 140,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16
              ),
              margin: EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 8
              ),
              child: Column(
                  crossAxisAlignment: isme ? CrossAxisAlignment.end: CrossAxisAlignment.start,
                children: [
                  // FutureBuilder(
                  //   future: FirebaseFirestore.instance.collection('users').doc(userId).get(),
                  //   builder: (context, snapshot) {
                  //     if(snapshot.connectionState == ConnectionState.waiting) {
                  //       return Text("Loading...");
                  //     }
                  //
                  //     return Text(
                  //       snapshot.data['username'], style: TextStyle(fontWeight: FontWeight.bold, color:  isme ? Colors.black : Theme.of(context).accentTextTheme.headline1.color),
                  //
                  //     );
                  //   }
                  //
                  // ),
                  Text(username, style: TextStyle(fontWeight: FontWeight.bold, color:  isme ? Colors.black : Theme.of(context).accentTextTheme.headline1.color)),
                  Text(message, textAlign: isme?  TextAlign.end: TextAlign.start ,style: TextStyle(color:  isme ? Colors.black : Theme.of(context).accentTextTheme.headline1.color),),
                ],
              ),
            ),
          ],
        ),

        // Positioned(
        //   top: 0 or -10 with overflow.visibale ,
        //     left: isme ? null : 120,
        //     right: isme? 120: null,
        //     child: CircleAvatar(radius: 20,)
        // ),
      ],
      // overflow: Overflow.visible,
    );
  }
}
