import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
import '../../common/bloc/upload_image/upload_images_bloc.dart';
import '../../common/route/routes.dart';
import '../../common/util/show_toast_message.dart';
import '../../data/datasources/Auth/auth_remote_data_source.dart';

class UploadImages extends StatefulWidget {
  const UploadImages({Key? key}) : super(key: key);

  @override
  State<UploadImages> createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
  File? imageFile;
  List<XFile> imageFileList = [];

  void selectImages() async {
    print('pressed scan for user A');
    final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);
    }
    setState(() {});
  }

  Future _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      // File imgFile = File(image.path);
      setState(() {
        this.imageFile = File(image.path);
      });
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
              StaggeredGrid.count(crossAxisCount: 3, children: [
                StaggeredGridTile.count(
                  crossAxisCellCount: 2,
                  mainAxisCellCount: 2,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.red,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                ),
                StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: 1,
                  child: Container(
                    height: 200,
                    width: 200,
                    color: Colors.blue,
                  ),
                ),
              ]),
              AppWidget.typeButtonStartAction2(
                  context: context,
                  input: 'Upload Images',
                  onPressed: () {
                    BlocProvider.of<UploadImagesBloc>(context)
                        .add(UserAUploadImagesEvent(images: imageFileList));
                  },
                  bgColor: primary,
                  borderColor: primary,
                  textColor: grey1100),
            ],
          ),
        ),
      ),
    );
  }
}
