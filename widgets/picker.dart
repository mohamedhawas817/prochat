import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path ;
import 'package:path_provider/path_provider.dart' as syspaths ;

class ImagePicke extends StatefulWidget {

  @override
  _ImagePickeState createState() => _ImagePickeState();
}

class _ImagePickeState extends State<ImagePicke> {

  File _image;

  Future<void> pickImage() async {
      final imageFile = await ImagePicker().pickImage(source: ImageSource.camera, maxWidth: 600);
      if(imageFile ==null) {
        return;
      }

      setState(() {
        _image = File(imageFile.path);

      });

      final appDir =await syspaths.getApplicationDocumentsDirectory();
      final fileName =path.basename(imageFile.path);
      final savedImage =await File(imageFile.path).copy('${appDir.path}/${fileName}');


  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CircleAvatar(radius: 30,),
        TextButton.icon(onPressed: (){}, icon: Icon(Icons.image), label: Text("Add Image")),


      ],
    );
  }
}
