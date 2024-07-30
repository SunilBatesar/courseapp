import 'package:courses_app/components/alltextformfield/searchtextfield.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/components/tile/courses_tile.dart';
import 'package:courses_app/components/tile/loding_tile.dart';
import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/controllers/class_controller.dart';
import 'package:courses_app/controllers/course_controller.dart';
import 'package:courses_app/controllers/language_controller.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:courses_app/data/localdata.dart';
import 'package:courses_app/res/services/appconfig.dart';
import 'package:courses_app/utils/enums/app_enum.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fonts = AppTextTheme();
  int buttonIndex = 0;

  @override
  void initState() {
    super.initState();
    data();
  }

  data() async {
    await courseprovider.setSearchfilterdataList();
  }

  final courseprovider = Get.find<CourseController>();
  final userData = Get.find<UserController>().userdata;
  final loadingController = Get.find<BoolSetter>();
  final classprovider = Get.find<ClassController>();
  final languageprovider = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.antiFlashWhite,
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                userData.status == DataStatus.LOADIND
                    ? const SizedBox()
                    : userData.status == DataStatus.ERROR
                        ? const SizedBox()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${"welcome".tr} ${userData.data!.name}👋",
                                style: AppTextTheme.fs20Medium,
                              ),
                              Container(
                                padding: EdgeInsets.all(2.sp),
                                height: 50.sp,
                                width: 50.sp,
                                decoration: const BoxDecoration(
                                    color: AppColor.white,
                                    shape: BoxShape.circle),
                                child: userData.data!.image.isNotEmpty
                                    ? ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        child: Image.network(
                                          userData.data!.image,
                                          fit: BoxFit.cover,
                                        ))
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        child: Image.asset(
                                          AppConfig.applogo,
                                          fit: BoxFit.cover,
                                        )),
                              ),
                            ],
                          ),
                Gap(30.h),
                GetBuilder<CourseController>(
                  builder: (controller) => SearchTextField(
                    text: "Figma...",
                    icon: Icons.search,
                    onchanged: (v) {
                      setState(() {
                        controller.setSearchOnchanged(v);
                        controller.setSearchfilterdataList();
                      });
                    },
                  ),
                ),
                Gap(10.h),
                GetBuilder<CourseController>(
                  builder: (controller) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          LocalData.filterlist.length,
                          (index) => Padding(
                                padding: EdgeInsets.only(right: 15.w),
                                child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        buttonIndex = index;
                                        controller.setHomeFilterData(LocalData
                                            .filterlist[index]["type"]);
                                        controller.setSearchfilterdataList();
                                      });
                                    },
                                    style: TextButton.styleFrom(
                                        backgroundColor: buttonIndex == index
                                            ? AppColor.raisinBlack
                                            : AppColor.white),
                                    child: Text(
                                      LocalData.filterlist[index]["title"],
                                      style: AppTextTheme.fs14Medium.copyWith(
                                          color: buttonIndex == index
                                              ? AppColor.white
                                              : AppColor.raisinBlack),
                                    )),
                              )),
                    ),
                  ),
                ),
                Gap(20.h),
                loadingController.loading
                    ? const LodingTile()
                    : Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Featured Class",
                                style: AppTextTheme.fs16Medium,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 15.w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: AppColor.white),
                                child: Text(
                                  "${courseprovider.searchfilterdataList.length} Class",
                                  style: AppTextTheme.fs14Medium
                                      .copyWith(color: AppColor.frenchGray),
                                ),
                              )
                            ],
                          ),
                          Gap(15.h),
                          GetBuilder<CourseController>(builder: (controller) {
                            // print("--------------");
                            // print(controller.homeFilterData);
                            // print(controller.searchfilterdataList.length);
                            // print("--------------");
                            return controller.searchfilterdataList.isNotEmpty
                                ? ListView.builder(
                                    itemCount:
                                        controller.searchfilterdataList.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => Padding(
                                      padding: EdgeInsets.only(bottom: 15.h),
                                      child: CoursesTile(
                                        onPressed: () {
                                          Get.toNamed(
                                              RouteName.courseDetailScreen,
                                              arguments: {
                                                "id": controller
                                                    .searchfilterdataList[index]
                                                    .id
                                              });
                                        },
                                        id: controller
                                            .searchfilterdataList[index].id!,
                                      ),
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      "No Class",
                                      style: AppTextTheme.fs20SemiBold,
                                    ),
                                  );
                          })
                        ],
                      ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
