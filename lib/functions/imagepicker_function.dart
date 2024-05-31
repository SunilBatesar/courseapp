// Get Image Gallery
import 'dart:io';

import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/services/app_services.dart';
import 'package:crop_image/crop_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

Future<String> getImageFormGallery() async {
  final ImagePicker picker = ImagePicker();
  // ignore: invalid_use_of_visible_for_testing_member
  var getImage = await picker.pickImage(source: ImageSource.gallery);
  // .getImageFromSource(source: ImageSource.gallery);

  String image = '';

  if (getImage != null) {
    image = getImage.path;
  }

  return image;
}

// Get Image Camra
Future<String> getImageFormCamera() async {
  var getImage =
      // ignore: invalid_use_of_visible_for_testing_member
      await ImagePicker.platform.getImageFromSource(source: ImageSource.camera);
  String image = '';
  if (getImage != null) {
    image = getImage.path;
  }
  return image;
}

imageSelectBottomshit(Function(File) file, BuildContext context) {
  showModalBottomSheet(
    backgroundColor: AppColor.raisinBlack,
    context: context,
    builder: (context) {
      return SizedBox(
        width: AppServices.screenWidth(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
                onPressed: () async {
                  File imagefile = File(await getImageFormCamera());
                  file(imagefile);
                  AppServices.popView(context);
                },
                icon: Icon(
                  Icons.camera,
                  size: 24.sp,
                  color: AppColor.white,
                ),
                label: Text(
                  "Camera",
                  style:
                      AppTextTheme.fs18Medium.copyWith(color: AppColor.white),
                )),
            Gap(10.h),
            TextButton.icon(
                onPressed: () async {
                  File imagefile = File(await getImageFormGallery());
                  file(imagefile);
                  AppServices.popView(context);
                },
                icon: Icon(
                  Icons.image,
                  size: 24.sp,
                  color: AppColor.white,
                ),
                label: Text(
                  "Gallery",
                  style:
                      AppTextTheme.fs18Medium.copyWith(color: AppColor.white),
                )),
            Gap(10.h),
            TextButton.icon(
                onPressed: () {
                  AppServices.popView(context);
                },
                icon: Icon(
                  Icons.delete,
                  size: 24.sp,
                  color: AppColor.white,
                ),
                label: Text(
                  "Delete",
                  style:
                      AppTextTheme.fs18Medium.copyWith(color: AppColor.white),
                )),
            Gap(10.h),
            TextButton.icon(
                onPressed: () {
                  AppServices.popView(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 24.sp,
                  color: AppColor.white,
                ),
                label: Text(
                  "Cancel",
                  style:
                      AppTextTheme.fs18Medium.copyWith(color: AppColor.white),
                )),
          ],
        ),
      );
    },
  );
}

// cropeImage(File file) {}

class Cropeimage extends StatefulWidget {
  final String title;

  const Cropeimage({super.key, required this.title});

  @override
  State<Cropeimage> createState() => _CropeimageState();
}

class _CropeimageState extends State<Cropeimage> {
  final controller = CropController(
    aspectRatio: 0.7,
    defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
  );
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: CropImage(
            controller: controller,
            image: Image.asset('assets/images/me_4.jpg'),
            paddingSize: 25.0,
            alwaysMove: true,
            minimumImageSize: 500,
            maximumImageSize: 500,
          ),
        ),
        bottomNavigationBar: _buildButtons(),
      );

  Widget _buildButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              controller.rotation = CropRotation.up;
              controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
              controller.aspectRatio = 1.0;
            },
          ),
          IconButton(
            icon: const Icon(Icons.aspect_ratio),
            onPressed: _aspectRatios,
          ),
          IconButton(
            icon: const Icon(Icons.rotate_90_degrees_ccw_outlined),
            onPressed: _rotateLeft,
          ),
          IconButton(
            icon: const Icon(Icons.rotate_90_degrees_cw_outlined),
            onPressed: _rotateRight,
          ),
          TextButton(
            onPressed: _finished,
            child: const Text('Done'),
          ),
        ],
      );

  Future<void> _aspectRatios() async {
    final value = await showDialog<double>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Select aspect ratio'),
          children: [
            // special case: no aspect ratio
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, -1.0),
              child: const Text('free'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 1.0),
              child: const Text('square'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 2.0),
              child: const Text('2:1'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 1 / 2),
              child: const Text('1:2'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 4.0 / 3.0),
              child: const Text('4:3'),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, 16.0 / 9.0),
              child: const Text('16:9'),
            ),
          ],
        );
      },
    );
    if (value != null) {
      controller.aspectRatio = value == -1 ? null : value;
      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
    }
  }

  Future<void> _rotateLeft() async => controller.rotateLeft();

  Future<void> _rotateRight() async => controller.rotateRight();

  Future<void> _finished() async {
    final image = await controller.croppedImage();
    // ignore: use_build_context_synchronously
    await showDialog<bool>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: const EdgeInsets.all(6.0),
          titlePadding: const EdgeInsets.all(8.0),
          title: const Text('Cropped image'),
          children: [
            Text('relative: ${controller.crop}'),
            Text('pixels: ${controller.cropSize}'),
            const SizedBox(height: 5),
            image,
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
