import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  UserImagePicker(this.imagePickerFn);
  final void Function(File picker) imagePickerFn;

  @override
  _UserImageState createState() => _UserImageState();
}

class _UserImageState extends State<UserImagePicker> {
  File _pickedImg;

  void _pickImage() async {
    final pickedImg = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );
    setState(() {
      _pickedImg = pickedImg;
    });
    widget.imagePickerFn(pickedImg);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _pickedImg != null ? FileImage(_pickedImg) : null,
        ),
        FlatButton.icon(
            textColor: Theme.of(context).primaryColor,
            onPressed: _pickImage,
            icon: Icon(Icons.image),
            label: Text('Add Image')),
      ],
    );
  }
}
