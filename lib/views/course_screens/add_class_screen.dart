import 'dart:io';

import 'package:courses_app/components/all_buttons/appbutton.dart';
import 'package:courses_app/components/alltextformfield/common_text_field.dart';
import 'package:courses_app/components/custom_appbar.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/controllers/class_controller.dart';
import 'package:courses_app/functions/FirebaseFunctions/firebasestorage_function.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddClassScreen extends StatefulWidget {
  const AddClassScreen({super.key});

  @override
  State<AddClassScreen> createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  // TextEditingController
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final courseid = Get.arguments["courseid"];
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

  final loadingController = Get.find<BoolSetter>();
  @override
  Widget build(BuildContext context) {
    final classprovider = Provider.of<ClassController>(context);
    return Scaffold(
      backgroundColor: AppColor.antiFlashWhite,
      appBar: CustomAppbar(
        context: context,
        title: const Text("Class"),
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
                text: "Description",
                controller: _descriptionController,
                maxlines: 4,
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
                    title: "Save Class",
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

                      final ClassModel data = ClassModel().copyWith(
                        name: _nameController.text.trim(),
                        duration: _durationController.text.trim(),
                        description: _descriptionController.text.trim(),
                        images: imageURLlist,
                        courseid: courseid,
                        datetime: datetimenow.toString(),
                      );
                      // NEW FUNCTION
                      await classprovider
                          .setClass(model: data, context: context)
                          .then((value) {
                        print("ADD CLASS");
                      });

                      // OLD FUNCTION
                      // await FirebaseFirestoreFunction()
                      //     .setClassDataFirestore(data, context);
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
