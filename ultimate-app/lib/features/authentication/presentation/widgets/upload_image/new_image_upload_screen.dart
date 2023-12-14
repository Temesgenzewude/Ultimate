




// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:path_provider/path_provider.dart';

// import '../../../app/widget_support.dart';
// import '../../../common/bloc/upload_image/upload_images_bloc.dart';
// import '../../../common/constant/colors.dart';
// import '../../../common/constant/images.dart';
// import '../../../common/constant/styles.dart';
// import '../../../common/widget/animation_click.dart';
// import '../../../common/widget/app_bar_cpn.dart';
// import '../../../common/widget/gradient_text.dart';

// class UploadImages extends StatefulWidget {
//   const UploadImages({Key? key}) : super(key: key);

//   @override
//   State<UploadImages> createState() => _UploadImagesState();
// }

// class _UploadImagesState extends State<UploadImages> {
//   File? imageFile;
//   List<XFile> imageFileList = [];

//   void selectImages() async {
//     print('pressed scan for user A');
//     final List<XFile>? selectedImages = await ImagePicker().pickMultiImage();
//     if (selectedImages!.isNotEmpty) {
//       imageFileList.addAll(selectedImages);
//     }
//     setState(() {});
//   }

//   Future _pickImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//       // File imgFile = File(image.path);
//       setState(() {
//         this.imageFile = File(image.path);
//       });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future _pickImageFromCamera() async {
//     try {
//       final cameraImage =
//           await ImagePicker().pickImage(source: ImageSource.camera);
//       if (cameraImage == null) return;
//       setState(() {
//         this.imageFile = File(cameraImage.path);
//       });
//     } on PlatformException catch (e) {
//       print('Failed to pick image: $e');
//     }
//   }

//   Future<File> storeImage(String imagePath) async {
//     final directory = await getApplicationCacheDirectory();
//     final name = basename(imagePath);
//     final image = File('${directory.path}/$name');
//     return File(imagePath).copy(image.path);
//   }

//   Widget item(String title, String subTitle, Color bgColor, Function() onTap) {
//     return AnimationClick(
//       function: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//             color: grey200, borderRadius: BorderRadius.circular(16)),
//         child: Row(
//           children: [
//             Container(
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                   color: bgColor, borderRadius: BorderRadius.circular(16)),
//               child: Image.asset(newPaper, width: 28, height: 28),
//             ),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: headline(color: grey1100),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     subTitle,
//                     style: subhead(color: grey800),
//                   )
//                 ],
//               ),
//             ),
//             const Icon(
//               Icons.keyboard_arrow_right_rounded,
//               size: 28,
//               color: grey500,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = AppWidget.getHeightScreen(context);
//     return Scaffold(
//       appBar: AppBarCpn(
//         left: Padding(
//           padding: const EdgeInsets.only(left: 16),
//           child: AnimationClick(
//             function: () => Navigator.of(context).pop(),
//             child: Image.asset(
//               icArrowLeft,
//               width: 24,
//               height: 24,
//               color: grey1100,
//             ),
//           ),
//         ),
//         right: AnimationClick(
//             child: Padding(
//           padding: const EdgeInsets.only(right: 16),
//           child: Text(
//             'Skip',
//             style: headline(color: corn1),
//           ),
//         )),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//           // crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 24),
//             Center(
//               child: Image.asset(
//                 bg6,
//                 height: height / 6,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 32, bottom: 8),
//               child: GradientText(
//                 'Upload up to 6 Images',
//                 style: const TextStyle(
//                     fontSize: 28,
//                     height: 1,
//                     fontWeight: FontWeight.w700,
//                     fontFamily: 'SpaceGrotesk'),
//                 gradient: LinearGradient(colors: [
//                   const Color(0xFFCFE1FD).withOpacity(0.9),
//                   const Color(0xFFFFFDE1).withOpacity(0.9),
//                 ]),
//               ),
//             ),
//             Text(
//               'Verify your identity as fast as you can',
//               textAlign: TextAlign.center,
//               style: body(color: grey800),
//             ),
//             const SizedBox(height: 32),
//             item(
//               'Scan your ID, Passport',
//               'Take picture of both side card',
//               green,
//               selectImages,
//             ),
//             const SizedBox(height: 24),
//             if (imageFileList.isNotEmpty)
//               Expanded(
//                 child: GridView.builder(
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 3),
//                     itemCount: imageFileList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       return SizedBox(
//                           height: 30,
//                           width: 30,
//                           child: Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               Image.file(File(imageFileList[index].path),
//                                   fit: BoxFit.cover),
//                               Positioned(
//                                   left: 90,
//                                   top: -20,
//                                   child: IconButton(
//                                       icon: const Icon(
//                                         Icons.delete_forever_rounded,
//                                         size: 30,
//                                         color: Colors.red,
//                                       ),
//                                       onPressed: () {
//                                         setState(() {
//                                           imageFileList.removeAt(index);
//                                         });
//                                       }))
//                             ],
//                           ));
//                     }),
//               ),
//             const SizedBox(height: 24),
//             BlocBuilder<UploadImagesBloc, UploadImagesState>(
//               builder: (context, state) {
//                 if (state is UploadImagesLoadingState) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (state is UploadImagesSuccessState) {
//                   Future.delayed(const Duration(seconds: 3), () {
//                     Navigator.of(context)
//                         .pushReplacementNamed(Routes.accountInformation);
//                   });
//                 } else if (state is UploadImagesFailureState) {
//                   Utils.flutterToast(state.errorMessage);
//                   return AppWidget.typeButtonStartAction2(
//                       context: context,
//                       input: 'Upload Images',
//                       onPressed: () {
//                         print(prefManager.kToken);
//                         print('here');
//                         BlocProvider.of<UploadImagesBloc>(context)
//                             .add(UserAUploadImagesEvent(images: imageFileList));
//                       },
//                       bgColor: primary,
//                       borderColor: primary,
//                       textColor: grey1100);
//                 }
//                 return AppWidget.typeButtonStartAction2(
//                     context: context,
//                     input: 'Upload Images',  
//                     onPressed: () {
//                       BlocProvider.of<UploadImagesBloc>(context)
//                           .add(UserAUploadImagesEvent(images: imageFileList));
//                     },
//                     bgColor: primary,
//                     borderColor: primary,
//                     textColor: grey1100);
//               },
//             ),
//             const SizedBox(height: 48)
//           ],
//         ),
//       ),
//     );
//   }
// }