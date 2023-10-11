// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';

import '../common/colors.dart';
import '../common/common.dart';
import '../screens/image_viewer.dart';

class ImageUploader extends StatefulWidget {
  const ImageUploader({super.key});

  @override
  State<ImageUploader> createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  File? _pickedImage;

  Future _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final pickedImage = File(image.path);
    setState(() {
      _pickedImage = pickedImage;
    });
    if (_pickedImage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageViewer(image: _pickedImage!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(13.0),
      color: isDarkMode(context) ? Colors.white : AppColors.doveGray,
      strokeWidth: 1,
      dashPattern: [4, 4],
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 37,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: isDarkMode(context) ? AppColors.steelGray : AppColors.whisper,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          child: Column(
            children: [
              Image.asset(
                'assets/gallery.png',
                height: 35,
                width: 35,
              ),
              SizedBox(height: 10),
              SizedBox(
                width: 140,
                child: Text(
                  'Upload you\'re images here',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: isDarkMode(context)
                        ? AppColors.silver
                        : AppColors.manatee,
                    fontSize: 10,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(61, 133, 200, 0.33),
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: InkWell(
                  onTap: _pickImage,
                  child: Text(
                    'Upload Picture',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
