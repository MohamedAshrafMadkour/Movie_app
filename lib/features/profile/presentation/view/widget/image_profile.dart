import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/core/utils/assets.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({super.key, required this.onImageSelected});
  final ValueChanged<File> onImageSelected;
  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? fileImage;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          setState(() {});
          try {
            final ImagePicker picker = ImagePicker();
            final XFile? image = await picker.pickImage(
              source: ImageSource.gallery,
            );
            if (image != null) {
              fileImage = File(image.path);
              widget.onImageSelected(fileImage!);
            }
          } catch (e) {
            isLoading = false;
            setState(() {});
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            fileImage != null
                ? Container(
                    height: 150,
                    width: 150,
                    decoration: ShapeDecoration(shape: OvalBorder()),
                    child: Image.file(fileImage!),
                  )
                : SvgPicture.asset(Assets.imagesUser, height: 100, width: 100),
            Visibility(
              visible: fileImage != null,
              child: Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    customDialog(context);
                  },
                  child: SvgPicture.asset(
                    Assets.imagesEdit,
                    height: 36,
                    width: 36,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> customDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Image'),
          content: const Text('Are you sure you want to delete?'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Cancel'),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.lightBlue),
              child: const Text('Delete'),
              onPressed: () {
                setState(() {
                  fileImage = null;
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
