import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostPage extends StatefulWidget {
  CreatePostPage({Key key}) : super(key: key);

  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  File _image;
  TextEditingController _captionController = TextEditingController();
  String _caption = '';
  bool _isLoading = false;

  _showSelectImageDialog() {
    Platform.isIOS ? _iosBottomSheet() : _androidDialog();
  }

  _iosBottomSheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return CupertinoActionSheet(
            title: Text('Envie Fotos'),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text('Tirar Foto'),
                onPressed: () => _handleImage(ImageSource.camera),
              ),
              CupertinoActionSheetAction(
                child: Text('Escolher da Galeria'),
                onPressed: () => _handleImage(ImageSource.gallery),
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text('Cancelar'),
              onPressed: () => Navigator.pop(context),
            ),
          );
        });
  }

  _androidDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('Envie Fotos'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('Tirar Foto'),
                onPressed: () => _handleImage(ImageSource.camera),
              ),
              SimpleDialogOption(
                child: Text('Escolher da Galeria'),
                onPressed: () => _handleImage(ImageSource.gallery),
              ),
              SimpleDialogOption(
                child: Text(
                  'Cancelar',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  _handleImage(ImageSource source) async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: source);
    if (imageFile != null) {
      imageFile = await _cropImage(imageFile);
      setState(() {
        _image = imageFile;
      });
    }
  }

  _cropImage(File imageFile) async{
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: imageFile.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    return croppedImage;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Create Post',
          style: TextStyle(
            color: Colors.black,
            fontSize: 35.0,
            fontFamily: 'Billabong',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => print('add'),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            onTap: _showSelectImageDialog,
            child: Container(
              height: width,
              width: width,
              color: Colors.grey[300],
              child: _image == null
                  ? Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                      size: 150.0,
                    )
                  : Image(
                      image: FileImage(_image),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(height: 20.0,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              controller: _captionController,
              style: TextStyle(fontSize: 18.0),
              decoration: InputDecoration(
                labelText: 'Legenda'
              ),
              onChanged: (input) => _caption = input,
            ),
          )
        ],
      ),
    );
  }
}
