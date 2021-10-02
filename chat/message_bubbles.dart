import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {


  ChatBubble(this.message, this.isme, {this.key});
  final String message;
  final bool isme;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: isme ? MainAxisAlignment.end :   MainAxisAlignment.start ,
      children: [
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
          child: Text(message ,style: TextStyle(color:  isme ? Colors.black : Theme.of(context).accentTextTheme.headline1.color),),
        ),
      ],
    );
  }
}
