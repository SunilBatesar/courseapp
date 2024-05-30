import 'dart:io';

import 'package:courses_app/components/all_buttons/appbutton.dart';
import 'package:courses_app/components/alltextformfield/common_text_field.dart';
import 'package:courses_app/components/custom_appbar.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/functions/FirebaseFunctions/firebasefirestore_functions.dart';
import 'package:courses_app/functions/FirebaseFunctions/firebasestorage_function.dart';
import 'package:courses_app/functions/imagepicker_function.dart';
import 'package:courses_app/services/app_services.dart';
import 'package:courses_app/services/appconfig.dart';
import 'package:courses_app/utils/validator.dart';
import 'package:courses_app/view_model/boolsetter.dart';
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
  //  Text Editing Controller
  final _nameController = TextEditingController();
  final _dateofBirthController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _addressController = TextEditingController();

  // User Dp URL
  String? userDpURL;

  File? imagefile;

  @override
  void initState() {
    super.initState();
    addValueAuto();
  }

  addValueAuto() {
    final user = Provider.of<UserViewModel>(context, listen: false).userdata;
    userDpURL = user.image!;
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
    print(imagefile);
    return Scaffold(
      appBar: CustomAppbar(context: context),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  imageSelectBottomshit((file) {
                    if (file.path.isNotEmpty) {
                      setState(() {
                        imagefile = file;
                      });
                    }
                  }, context);
                },
                child: Stack(
                  children: [
                    Container(
                      height: 100.sp,
                      width: 100.sp,
                      padding: EdgeInsets.all(2.sp),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColor.frenchGray, width: 2),
                      ),
                      child: imagefile == null
                          ? (userDpURL!.isNotEmpty && userDpURL != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Image.network(
                                    userDpURL!,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(1000),
                                  child: Image.asset(
                                    AppConfig.applogo,
                                    fit: BoxFit.cover,
                                  ),
                                ))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.file(
                                imagefile!,
                                height: 100.sp,
                                width: 100.sp,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          padding: EdgeInsets.all(5.sp),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.frenchGray,
                            border: Border.all(color: AppColor.white, width: 2),
                          ),
                          child: Icon(
                            size: 20.sp,
                            Icons.camera_alt_outlined,
                            color: AppColor.white,
                          )),
                    )
                  ],
                ),
              ),
              Gap(20.h),
              Form(
                key: _key,
                child: Column(
                  children: [
                    CommonTextField(
                      text: "Name",
                      controller: _nameController,
                      validator: TextValidator(),
                    ),
                    Gap(20.h),
                    CommonTextField(
                      text: "Date of Birth",
                      keyboardtype: TextInputType.datetime,
                      controller: _dateofBirthController,
                      validator: TextValidator(),
                    ),
                    Gap(20.h),
                    CommonTextField(
                      text: "Phone Number",
                      keyboardtype: TextInputType.phone,
                      controller: _phonenumberController,
                      validator: TextValidator(),
                    ),
                    Gap(20.h),
                    CommonTextField(
                      text: "Address",
                      controller: _addressController,
                      validator: TextValidator(),
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              Consumer<BoolSetter>(
                  builder: (context, value, child) => Row(
                        children: [
                          AppButton(
                            title: "Save",
                            onPressed: () {
                              _getValidText(context);
                            },
                            isExpanded: true,
                            isloading: value.loading,
                          ),
                        ],
                      ))
            ],
          ),
        ),
      )),
    );
  }

  _getValidText(BuildContext context) async {
    final userprovider =
        Provider.of<UserViewModel>(context, listen: false).userdata;
    if (_key.currentState!.validate()) {
      String urlimage = userDpURL!;
      if (imagefile != null && imagefile!.path.isNotEmpty) {
        if (userDpURL != null && userDpURL!.isNotEmpty) {
          urlimage = await FirebaseStorageFunction()
              .imageUpdate(userDpURL!, imagefile!, context);
        } else {
          urlimage = await FirebaseStorageFunction()
              .addimageStorage(imagefile!, context);
        }
      }
      FirebaseFirestoreFunction().userDataUpdateFirestore(
          userprovider.copyWith(
            name: _nameController.text.trim(),
            dateofBirth: _dateofBirthController.text.trim(),
            phonenumber: int.parse(_phonenumberController.text.trim()),
            address: _addressController.text.trim(),
            image: urlimage,
          ),
          context);
      AppServices.popView(context);
    }
  }
}
