import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/theme/app_theme.dart';

class ImageContainer extends StatefulWidget {
  final TextEditingController imagePath;
  const ImageContainer(
    this.imagePath, {
    super.key,
  });

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  File? _image;
  final picker = ImagePicker();
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        widget.imagePath.text = pickedFile.path;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _pickImage(),
      child: Card(
        clipBehavior: Clip.antiAlias,
        color: AppColors.secondaryColor.withOpacity(0.25),
        child: _image == null
            ? const Center(
                child: Icon(
                  Icons.image_outlined,
                  size: 128,
                ),
              )
            : Image.file(
                _image!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
