// Get Image Gallery
import 'dart:io';

import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/services/app_services.dart';
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
