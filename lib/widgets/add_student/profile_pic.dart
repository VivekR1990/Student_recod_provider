import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sutdent_provider/provider/image_provider.dart';

class ProfilePicSelect extends StatelessWidget {
  const ProfilePicSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final ImageProvide imgProvider =
        Provider.of<ImageProvide>(context, listen: false);
    return Stack(children: [
      Consumer<ImageProvide>(
        builder: (context, value, child) {
          return CircleAvatar(
            radius: 80,
            backgroundImage: value.selectedImage != null
                ? FileImage(value.selectedImage!)
                : null,
            child: value.selectedImage == null
                ? const Icon(
                    Icons.person,
                    size: 80,
                  )
                : null,
          );
        },
      ),
      Positioned(
        bottom: 0,
        right: 10,
        child: IconButton(
            onPressed: () async {
              imgProvider.selectImageFromGalleryOrCamera(ImageSource.gallery);
            },
            icon: const Icon(Icons.camera_alt)),
      )
    ]);
  }
}
