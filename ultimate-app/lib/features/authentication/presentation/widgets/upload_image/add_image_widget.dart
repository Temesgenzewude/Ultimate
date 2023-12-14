import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';
import 'package:image_picker/image_picker.dart';

Widget addImageWidget(dynamic picture, Function onAddImage,
    List<XFile> selectedImages, int index) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        onAddImage();
        print(selectedImages);
        print('Heree==========================');
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: Color.fromARGB(255, 84, 82, 82)),
          child: picture == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.camera_alt,
                      size: 50,
                    ),
                    Container(
                      width: 100,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: primary),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 25,
                          ),
                          Text(
                            'Add',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Image.file(
                  File(selectedImages[index].path),
                  fit: BoxFit.cover,
                )),
    ),
  );
}
