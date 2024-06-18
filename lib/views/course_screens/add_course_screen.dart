import 'dart:io';

import 'package:courses_app/components/all_buttons/appbutton.dart';
import 'package:courses_app/components/alltextformfield/common_text_field.dart';
import 'package:courses_app/components/custom_appbar.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/controllers/course_controller.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:courses_app/data/localdata.dart';
import 'package:courses_app/functions/FirebaseFunctions/firebasestorage_function.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddCourseScreen extends StatefulWidget {
  final bool isbool;
  const AddCourseScreen({
    super.key,
    this.isbool = false,
  });

  @override
  State<AddCourseScreen> createState() => _AddCourseScreenState();
}

class _AddCourseScreenState extends State<AddCourseScreen> {
  // TextEditingController
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _languageController = TextEditingController();
  final _priceController = TextEditingController();

  //
  String? coursetypeValue;
  //
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  List<XFile>? deleteimageFileList = [];

  void selectImages() async {
    final List<XFile> selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    setState(() {});
  }

  final courseprovider = Get.find<CourseController>();
  final loadingController = Get.find<BoolSetter>();
  @override
  Widget build(BuildContext context) {
    final user = Get.find<UserController>().userdata;
    return Scaffold(
      backgroundColor: AppColor.antiFlashWhite,
      appBar: CustomAppbar(
        context: context,
        title: const Text("Course"),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            children: [
              CommonTextField(
                text: "Name",
                controller: _nameController,
              ),
              Gap(20.h),
              CommonTextField(
                text: "Duration",
                controller: _durationController,
              ),
              Gap(20.h),
              CommonTextField(
                text: "Language",
                controller: _languageController,
              ),
              Gap(20.h),
              CommonTextField(
                text: "Price",
                controller: _priceController,
              ),
              Gap(20.h),
              CommonTextField(
                text: "Description",
                controller: _descriptionController,
                maxlines: 4,
              ),
              Gap(20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.raisinBlack),
                    borderRadius: BorderRadius.circular(10.r)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                      isExpanded: true,
                      hint: Text(
                        "Choose Course Type",
                        style: AppTextTheme.fs14Normal,
                      ),
                      items: LocalData.filterlist
                          .map((e) => DropdownMenuItem(
                              value: e["title"],
                              child: Text(
                                e["title"],
                                style: AppTextTheme.fs16Medium,
                              )))
                          .toList(),
                      value: coursetypeValue,
                      onChanged: (v) {
                        setState(() {
                          coursetypeValue = v.toString();
                        });
                      }),
                ),
              ),
              Gap(20.h),
              AppButton(
                  title: "Images",
                  onPressed: () {
                    selectImages();
                  }),
              Gap(10.h),
              // Image Delete button
              deleteimageFileList!.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        imageFileList!.removeWhere((element) =>
                            (deleteimageFileList!.any((e) => e == element)));
                        deleteimageFileList = [];
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: AppColor.oringe,
                      ))
                  : const SizedBox(),
              Gap(10.h),
              // Showe Images
              GridView.builder(
                itemCount: imageFileList!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h),
                itemBuilder: (context, index) {
                  final img = imageFileList![index];
                  return InkWell(
                    onTap: () {
                      if (deleteimageFileList!.contains(img)) {
                        deleteimageFileList!.remove(img);
                      } else {
                        deleteimageFileList!.add(img);
                      }
                      setState(() {});
                    },
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.file(
                          File(img.path),
                          width: 100.sp,
                          height: 100.sp,
                          fit: BoxFit.cover,
                        ),
                        deleteimageFileList!.contains(img)
                            ? Icon(
                                Icons.check_circle_sharp,
                                color: AppColor.oringe,
                                size: 24.sp,
                              )
                            : const SizedBox()
                      ],
                    ),
                  );
                },
              ),
              Gap(10.h),
              Row(
                children: [
                  AppButton(
                    title: "Save Corse",
                    isExpanded: true,
                    isloading: loadingController.loading,
                    onPressed: () async {
                      final List<String> imageURLlist = [];
                      for (var fileX in imageFileList!) {
                        final String url = await FirebaseStorageFunction()
                            .addimageStorage(File(fileX.path), context);
                        imageURLlist.add(url);
                      }
                      final DateTime datetimenow = DateTime.now();
                      final CourseModel coursedata = CourseModel().copyWith(
                          name: _nameController.text.trim(),
                          duration: _durationController.text.trim(),
                          language: _languageController.text.trim(),
                          price: int.parse(_priceController.text.trim()),
                          description: _descriptionController.text.trim(),
                          coursetype: coursetypeValue,
                          datetime: datetimenow.toString(),
                          images: imageURLlist,
                          userid: user.uid);

                      await courseprovider.setCourse(coursedata, context);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
