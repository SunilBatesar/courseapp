import 'package:courses_app/components/all_buttons/appbutton.dart';
import 'package:courses_app/components/alltextformfield/common_text_field.dart';
import 'package:courses_app/components/custom_appbar.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:courses_app/res/services/appconfig.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:courses_app/utils/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // GlobalKey
  final _key = GlobalKey<FormState>();

  // TextEditingController
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  
  final userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.antiFlashWhite,
      appBar: CustomAppbar(
        context: context,
        title: const Text("Login"),
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
                        text: "Email",
                        keyboardtype: TextInputType.emailAddress,
                        controller: _emailController,
                        validator: EmailValidator(),
                      ),
                      Gap(20.h),
                      CommonTextField(
                        text: "Password",
                        controller: _passwordController,
                        validator: PasswordValidator(),
                      ),
                    ],
                  )),
              Gap(20.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forget Password?",
                    style: AppTextTheme.fs14Medium,
                  ),
                ),
              ),
              Gap(40.h),
              Consumer<BoolSetter>(
                builder: (context, setter, child) {
                  final bool loading = setter.loading;
                  return Row(
                    children: [
                      AppButton(
                        title: "Login",
                        isloading: loading,
                        onPressed: () async {
                          await _getValidText(userController, context);
                        },
                        isExpanded: true,
                      ),
                    ],
                  );
                },
              ),
              Gap(180.h),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text.rich(TextSpan(
                    text: "Don’t have account?",
                    style: AppTextTheme.fs14Normal,
                    children: <TextSpan>[
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RouteName.singnupScreen);
                            },
                          text: "  Create new account.",
                          style: const TextStyle(color: AppColor.oringe))
                    ])),
              )
            ],
          ),
        ),
      )),
    );
  }

  Future _getValidText(
      UserController userc, BuildContext context) async {
    if (_key.currentState!.validate()) {
      await userc.login(_emailController.text.trim(),
          _passwordController.text.trim(), context);
    }
  }
}
