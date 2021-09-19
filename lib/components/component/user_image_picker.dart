import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:platformx/platformx.dart';

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
  Image? _imagemWeb;
  File? _image;

  // Future<void> _pickImage() async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(
  //     source: ImageSource.gallery,
  //     imageQuality: 50,
  //     maxWidth: 150,
  //   );

  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });

  //     widget.onImagePick(_image!);
  //   }
  // }

  //*! esse daki é do image picker web
  Future<void> _pickImageWeb() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        setState(() {
          if (PlatformX.isWeb) {
            _imagemWeb = Image.network(pickedFile.path);
            //ver a questao ainda de transformar em file
          } else {
            //CELULARES
            _image = File(pickedFile.path);
          }
        });
      }
      widget.onImagePick(_image!);
    });
  }

  ImageProvider exibirImagem({Image? imagem, File? imageFile}) {
    if (PlatformX.isWeb) {
      return imagem!.image;
    } else {
      return FileImage(imageFile!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _image != null
              ? exibirImagem(imagem: _imagemWeb, imageFile: _image)
              : null,
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
