import 'package:courses_app/components/all_buttons/appbutton.dart';
import 'package:courses_app/components/alltextformfield/common_text_field.dart';
import 'package:courses_app/components/custom_appbar.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/res/services/appconfig.dart';
import 'package:courses_app/utils/enums/app_enum.dart';
import 'package:courses_app/utils/validator.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SingnupScreen extends StatefulWidget {
  const SingnupScreen({super.key});

  @override
  State<SingnupScreen> createState() => _SingnupScreenState();
}

class _SingnupScreenState extends State<SingnupScreen> {
  //  GlobalKey
  final _key = GlobalKey<FormState>();
  List<Profession> professionList = Profession.values;
  Profession? professionValue;

  // TextEditingController
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _dateofBirthController = TextEditingController();
  final _phonenumberController = TextEditingController();
  final _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.antiFlashWhite,
      appBar: CustomAppbar(
        context: context,
        title: const Text("Sing Up"),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                AppConfig.applogo,
                height: 100.sp,
                width: 100.sp,
              ),
              Gap(10.h),
              Text(
                AppConfig.appName,
                style: AppTextTheme.fs18Medium.copyWith(color: AppColor.oringe),
              ),
              Gap(50.h),
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
                        text: "Email",
                        controller: _emailController,
                        validator: EmailValidator(),
                      ),
                      Gap(20.h),
                      CommonTextField(
                        text: "Password",
                        controller: _passwordController,
                        validator: PasswordValidator(),
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
                  )),
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
                        "Choose Profession",
                        style: AppTextTheme.fs14Normal,
                      ),
                      items: professionList
                          .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(
                                e.name,
                                style: AppTextTheme.fs16Medium,
                              )))
                          .toList(),
                      value: professionValue,
                      onChanged: (v) {
                        setState(() {
                          professionValue = v;
                        });
                      }),
                ),
              ),
              Gap(40.h),
              Consumer2<BoolSetter, UserViewModel>(
                builder: (context, setter, user, child) {
                  final bool loading = setter.loading;
                  return Row(
                    children: [
                      AppButton(
                        title: "Sing Up",
                        isloading: loading,
                        onPressed: () {
                          getValidText(user);
                        },
                        isExpanded: true,
                      ),
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

  getValidText(UserViewModel provider) {
    if (_key.currentState!.validate()) {
      final UserModel user = UserModel().copyWith(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          dateofBirth: _dateofBirthController.text.trim(),
          phonenumber: int.parse(_phonenumberController.text.trim()),
          address: _addressController.text.trim(),
          profession: professionValue);
    }
  }
}
