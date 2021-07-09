import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'anaSayfa.dart';



/// Widget to capture and crop the image
class resimYakalama extends StatefulWidget {
  createState() => _resimYakalamaState();
}

class _resimYakalamaState extends State<resimYakalama> {


  File _imageFile;


  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        );

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }


  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }


  void _clear() {
    setState(() => _imageFile = null);
  }

  Future<bool> _onBackPressed() {

    return showDialog(
        context: context,
        builder: (context) => anaSayfa()
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.photo_camera,
                  size: 30,
                ),
                onPressed: () => _pickImage(ImageSource.camera),
                color: Colors.blue,
              ),
              IconButton(
                icon: Icon(
                  Icons.photo_library,
                  size: 30,
                ),
                onPressed: () => _pickImage(ImageSource.gallery),
                color: Colors.pink,
              ),
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            if (_imageFile != null) ...[
              Container(
                  padding: EdgeInsets.all(32), child: Image.file(_imageFile)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TextButton(

                    child: Icon(Icons.crop),
                    onPressed: _cropImage,
                  ),
                  TextButton(

                    child: Icon(Icons.refresh),
                    onPressed: _clear,
                  ),
                ],
              ),

            ]
          ],
        ),
      ),
    );
  }
}

