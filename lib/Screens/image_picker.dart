import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
class Imagepk extends StatefulWidget {
  const Imagepk({Key key}) : super(key: key);

  @override
  _ImagepkState createState() => _ImagepkState();
}

class _ImagepkState extends State<Imagepk> {
  File image ;
  Future pickImage(ImageSource source) async{
    try {
      final image = await ImagePicker.pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
      });
    } on PlatformException catch (e){
      print('failed to  pick image');
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FlatButton.icon(
            icon: Icon(FontAwesomeIcons.mapMarkedAlt),
            onPressed: (){
              pickImage(ImageSource.camera);

            },
            label: Text ('pick camera'),
          )
        ],
      ),

    );
  }
}
