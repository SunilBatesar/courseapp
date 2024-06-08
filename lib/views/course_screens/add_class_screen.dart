import 'dart:io';

import 'package:courses_app/components/all_buttons/appbutton.dart';
import 'package:courses_app/components/alltextformfield/common_text_field.dart';
import 'package:courses_app/components/custom_appbar.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/functions/FirebaseFunctions/firebasestorage_function.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/class_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddClassScreen extends StatefulWidget {
  final String courseid;
  const AddClassScreen({super.key, required this.courseid});

  @override
  State<AddClassScreen> createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  // TextEditingController
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();
  final _descriptionController = TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    final classprovider = Provider.of<ClassViewModel>(context);
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
              Consumer<BoolSetter>(
                builder: (context, value, child) {
                  final bool loading = value.loading;
                  return Row(
                    children: [
                      AppButton(
                        title: "Save Class",
                        isExpanded: true,
                        isloading: loading,
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
                            courseid: widget.courseid,
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
                  );
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
