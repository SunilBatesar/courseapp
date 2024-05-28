import 'dart:io';

import 'package:courses_app/components/all_buttons/appbutton.dart';
import 'package:courses_app/components/alltextformfield/common_text_field.dart';
import 'package:courses_app/components/custom_appbar.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/functions/imagepicker_function.dart';
import 'package:courses_app/utils/validator.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // GlobalKey
  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _dateofBirthController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _addressController = TextEditingController();

  File? imagefile;
  @override
  void initState() {
    super.initState();
    addValueAuto();
  }

  addValueAuto() {
    final user = Provider.of<UserViewModel>(context, listen: false).userdata;
    _nameController.text = user.name!;
    _dateofBirthController.text =
        user.dateofBirth!.isEmpty || user.dateofBirth == null
            ? ""
            : user.dateofBirth!;
    _phonenumberController.text =
        user.phonenumber == null || user.phonenumber == 0
            ? ""
            : user.phonenumber.toString();
    _addressController.text =
        user.address!.isEmpty || user.address == null ? "" : user.address!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(context: context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  clipBehavior: Clip.none,
                  borderRadius: BorderRadius.circular(1000),
                  child: GestureDetector(
                    onTap: () {
                      imageSelectBottomshit((file) {
                        if (file.path.isNotEmpty) {
                          setState(() {
                            imagefile = file;
                          });
                        }
                      }, context);
                    },
                    child: CircleAvatar(
                      radius: 45.r,
                      backgroundColor: AppColor.white,
                      backgroundImage:
                          const AssetImage('assets/images/me_4.jpg'),
                      child: Transform.translate(
                          offset: Offset(40.sp, 20.sp),
                          child: Container(
                              padding: EdgeInsets.all(5.sp),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.raisinBlack,
                                border:
                                    Border.all(color: AppColor.white, width: 2),
                              ),
                              child: Icon(
                                size: 20.sp,
                                Icons.camera_alt_outlined,
                                color: AppColor.white,
                              ))),
                    ),
                  )),
              Gap(20.h),
              Form(
                key: _key,
                child: Column(
                  children: [
                    CommonTextField(
                      text: "Name",
                      controller: _nameController,
                      validator: (v) => AppValidator.textValidator(v, "Name"),
                    ),
                    Gap(20.h),
                    CommonTextField(
                      text: "Date of Birth",
                      keyboardtype: TextInputType.datetime,
                      controller: _dateofBirthController,
                      validator: (v) =>
                          AppValidator.textValidator(v, "Date of Birth"),
                    ),
                    Gap(20.h),
                    CommonTextField(
                      text: "Phone Number",
                      keyboardtype: TextInputType.phone,
                      controller: _phonenumberController,
                      validator: (v) => AppValidator.phoneNumberValidator(v),
                    ),
                    Gap(20.h),
                    CommonTextField(
                      text: "Address",
                      controller: _addressController,
                      validator: (v) =>
                          AppValidator.textValidator(v, "Address"),
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              Row(
                children: [
                  AppButton(
                    title: "Save",
                    onPressed: () {
                      _getValidText(context);
                    },
                    isExpanded: true,
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  _getValidText(BuildContext context) {
    if (_key.currentState!.validate()) {}
  }
}
