import 'package:flutter/material.dart';
import 'package:flutter_ultimate/common/constant/colors.dart';

Widget addImageWidget(dynamic picture, Function onAddImage) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        onAddImage();
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
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: primary),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            size: 40,
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
              : Image.asset(
                  picture,
                  fit: BoxFit.cover,
                )),
    ),
  );
}
