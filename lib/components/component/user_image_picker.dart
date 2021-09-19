import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File image) onImagePick;

  const UserImagePicker({
    Key? key,
    required this.onImagePick,
  }) : super(key: key);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });

      widget.onImagePick(_image!);
    }
  }

  //*! esse daki é do image picker web
  Image? _fromPicker;
  Future<void> _pickImageWeb() async {
    await ImagePickerWeb.getImage(outputType: ImageType.widget).then((value) {
      if (value != null) {
        print(value);
      }
    });
    setState(() {
      //_fromPicker = pickedImage;
      //_fromPicker = pickedImage as Image?;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _fromPicker != null ? _fromPicker?.image : null,
        ),
        TextButton(
          //onPressed: _pickImage,
          onPressed: _pickImageWeb,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, color: Theme.of(context).primaryColor),
              const SizedBox(width: 10),
              const Text('Adicionar imagem')
            ],
          ),
        ),
      ],
    );
  }
}
