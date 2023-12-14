import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ultimate/features/authentication/presentation/bloc/upload_image/upload_images_bloc.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../app/widget_support.dart';

import '../../../../../../common/widget/animation_click.dart';


import '../../../../../common/constant/colors.dart';
import '../../../../../common/constant/images.dart';
import '../../../../../common/constant/styles.dart';
import '../../../../../common/route/routes.dart';
import '../../../../../common/util/show_toast_message.dart';
import '../../../../../common/widget/app_bar_cpn.dart';
import '../../../../../dependency_indjection.dart';
import '../../../../../sharedPreferences.dart';
import '../../widgets/upload_image/new_upload_image.dart';

class NewUploadImageScreen extends StatefulWidget {
  const NewUploadImageScreen({Key? key}) : super(key: key);

  @override
  State<NewUploadImageScreen> createState() => _NewUploadImageScreenState();
}

class _NewUploadImageScreenState extends State<NewUploadImageScreen> {
  File? imageFile;
  List<XFile> imageFileList = [];
  final prefManager = sl<PrefManager>();

  Future<void> selectImages() async {
    try {
      final XFile? selectedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (selectedImage != null) {
        imageFileList.add(selectedImage);
      }
      setState(() {});
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
  Widget build(BuildContext context) {
    final width = AppWidget.getWidthScreen(context);

    void _validateSelectedImages() {
      if (imageFileList.isNotEmpty && imageFileList.length <= 6) {
        BlocProvider.of<UploadImagesBloc>(context)
            .add(UserAUploadImagesEvent(images: imageFileList));
      } else {
        Utils.flutterToast(
            'Please select at least 1 image and maximum 6 images');
      }
    }

    @override
    void initState() {
      // prefManager.lastViewedPage = Routes.newUploadImagesB;
      super.initState();
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBarCpn(
          left: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: AnimationClick(
              // function: () {
              //   Navigator.of(context).pop();
              // },
              child: Image.asset(
                logo,
                width: 24,
                height: 24,
                color: grey1100,
              ),
            ),
          ),
          center: Text(
            'Upload Images',
            style: headline(color: grey1100),
          ),
        
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: AnimationClick(
                function: imageFileList.length < 6 ? selectImages : null,
                child: SizedBox(
                  width: width / 3,
                  child: UploadImage().dotted(),
                ),
              ),
            ),
            const SizedBox(height: 24),
            if (imageFileList.isNotEmpty)
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemCount: imageFileList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          height: 150,
                          width: 150,
                          child: Stack(
                            // clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                child: Image.file(
                                  File(imageFileList[index].path),
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 150,
                                ),
                              ),
                              Positioned(
                                  right: -15,
                                  top: -15,
                                  child: IconButton(
                                      icon: const Icon(
                                        Icons.delete_forever_rounded,
                                        size: 30,
                                        color: Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          imageFileList.removeAt(index);
                                        });
                                      }))
                            ],
                          ));
                    }),
              ),
            const SizedBox(height: 24),
            BlocConsumer<UploadImagesBloc, UploadImagesState>(
              listener: (context, state) {
                if (state is UploadImagesSuccessState) {
                  Utils.flutterToast('Images Uploaded successfully!');
                  Future.delayed(const Duration(seconds: 3), () {
                    Navigator.of(context)
                        .pushReplacementNamed(Routes.interest_1);
                  });
                } else if (state is UploadImagesFailureState) {
                  Utils.flutterToast(state.errorMessage);
                }
              },
              builder: (context, state) {
                if (state is UploadImagesLoadingState) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: CircularProgressIndicator(),
                  ));
                } else if (state is UploadImagesSuccessState) {
                  return Container();
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: AppWidget.typeButtonStartAction2(
                        context: context,
                        input: 'Upload Images',
                        onPressed: () {
                          _validateSelectedImages();
                        },
                        bgColor: imageFileList.isNotEmpty &&
                                imageFileList.length <= 6
                            ? primary
                            : Colors.grey,
                        borderColor: imageFileList.isNotEmpty &&
                                imageFileList.length <= 6
                            ? primary
                            : Colors.grey,
                        textColor: grey1100),
                  );
                }
           
              },
            ),
          ],
        ),
      ),
    );
  }
}
