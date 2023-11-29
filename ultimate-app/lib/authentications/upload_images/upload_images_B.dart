import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_ultimate/common/bloc/upload_image/upload_images_b/upload_images_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../app/widget_support.dart';
import '../../../common/constant/colors.dart';
import '../../../common/constant/images.dart';
import '../../../common/constant/styles.dart';
import '../../../common/widget/animation_click.dart';
import '../../../common/widget/app_bar_cpn.dart';
import '../../../common/widget/gradient_text.dart';
import '../../common/bloc/upload_image/upload_images_b/upload_images_bloc.dart';
import '../../common/route/routes.dart';
import '../../common/util/show_toast_message.dart';
import '../../data/datasources/Auth/auth_remote_data_source.dart';

class UploadImagesB extends StatefulWidget {
  const UploadImagesB({Key? key}) : super(key: key);

  @override
  State<UploadImagesB> createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImagesB> {
  bool _isUploadReady = false;
  File? imageFile;
  List<XFile> imageFileList = [];
  Map<int, XFile?> indexToImage = {
    0: null,
    1: null,
    2: null,
    3: null,
    4: null,
    5: null,
  };

  void selectImages() async {
    print('pressed scan for user A');
    final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
    setState(() {});
  }

  void _pickImage(int index) async {
    try {
      print(imageFileList);
      print(indexToImage);
      print("===============================================");
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() {
        this.indexToImage[index] = image;
      });
      bool temp_bool = true;
      indexToImage.forEach((key, value) {
        if (value == null) {
          temp_bool = false;
        }
      });
      _isUploadReady = temp_bool;
      print("=====================================Got here");
      print(_isUploadReady);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future _pickImageFromCamera() async {
    try {
      final cameraImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (cameraImage == null) return;
      setState(() {
        this.imageFile = File(cameraImage.path);
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> storeImage(String imagePath) async {
    final directory = await getApplicationCacheDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  void initState() {
    prefManager.lastViewedPage = Routes.uploadImages;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = AppWidget.getHeightScreen(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBarCpn(
          left: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: AnimationClick(
              // function: () => Navigator.of(context).pop(),
              child: Image.asset(
                logo,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Image.asset(
                  bg6,
                  height: height / 6,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 8),
                child: GradientText(
                  'Upload your images',
                  style: const TextStyle(
                      fontSize: 28,
                      height: 1,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SpaceGrotesk'),
                  gradient: LinearGradient(colors: [
                    const Color(0xFFCFE1FD).withOpacity(0.9),
                    const Color(0xFFFFFDE1).withOpacity(0.9),
                  ]),
                ),
              ),
              Text(
                'Verify your identity as fast as you can',
                textAlign: TextAlign.center,
                style: body(color: grey800),
              ),
              StaggeredGrid.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount: 2,
                      child: addImageWidget(indexToImage[0], 0),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: addImageWidget(indexToImage[1], 1),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: addImageWidget(indexToImage[2], 2),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: addImageWidget(indexToImage[3], 3),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: addImageWidget(indexToImage[4], 4),
                    ),
                    StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: addImageWidget(indexToImage[5], 5),
                    ),
                  ]),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<UserBUploadImagesBloc, UserBUploadImagesState>(
                builder: (context, state) {
                  if (state is UserBUploadImagesLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserBUploadImagesSuccessState) {
                    Utils.flutterToast(
                        "Your images have been successfully uploaded");
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.of(context)
                          .pushReplacementNamed(Routes.accountInformationOne);
                    });
                  } else if (state is UserBUploadImagesFailureState) {
                    Utils.flutterToast(state.errorMessage);
                    return AppWidget.typeButtonStartAction2(
                        context: context,
                        input: 'Upload Images',
                        onPressed: () {
                          imageFileList = [];

                          print(prefManager.kTokenB);
                          print('here');

                          indexToImage.forEach((key, value) {
                            if (value != null) {
                              imageFileList.add(value);
                            }
                          });
                          if (imageFileList.length == 6) {
                            BlocProvider.of<UserBUploadImagesBloc>(context).add(
                                UserBUploadImagesEvent(images: imageFileList));
                          }
                        },
                        bgColor: _isUploadReady ? primary : Colors.grey,
                        borderColor: _isUploadReady ? primary : Colors.grey,
                        textColor: grey1100);
                  }
                  return AppWidget.typeButtonStartAction2(
                      context: context,
                      input: 'Upload Images',
                      onPressed: () {
                        imageFileList = [];
                        indexToImage.forEach((key, value) {
                          if (value != null) {
                            imageFileList.add(value);
                          }
                        });
                        print(imageFileList);
                        print("============================");
                        if (imageFileList.length == 6) {
                          BlocProvider.of<UserBUploadImagesBloc>(context).add(
                              UserBUploadImagesEvent(images: imageFileList));
                        }
                      },
                      bgColor: _isUploadReady ? primary : Colors.grey,
                      borderColor: _isUploadReady ? primary : Colors.grey,
                      textColor: grey1100);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget addImageWidget(dynamic picture, int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _pickImage(index);
          // setState(() {
          //   indexToImage[index] = image;
          // });
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
                : Stack(
                    children: [
                      Positioned.fill(
                        child: Image.file(
                          File(indexToImage[index]!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
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
                        ),
                      )
                    ],
                  )),
      ),
    );
  }
}
