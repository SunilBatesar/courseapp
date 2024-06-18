import 'package:courses_app/components/alltextformfield/searchtextfield.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/components/tile/courses_tile.dart';
import 'package:courses_app/components/tile/loding_tile.dart';
import 'package:courses_app/controllers/boolsetter.dart';
import 'package:courses_app/controllers/class_controller.dart';
import 'package:courses_app/controllers/course_controller.dart';
import 'package:courses_app/controllers/user_controller.dart';
import 'package:courses_app/data/localdata.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/res/services/appconfig.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final fonts = AppTextTheme();
  int buttonIndex = 0;
  String bottonValuetype = "";
  String searchOnchanged = "";
  List<CourseModel> filterdataList = [];

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    if (!await rebuild()) return;
    bottonValuetype = LocalData.filterlist.first["type"];
    setState(() {});
  }

  Future<bool> rebuild() async {
    if (!mounted) return false;
    // if there's a current frame,
    if (SchedulerBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      // wait for the end of that frame.
      await SchedulerBinding.instance.endOfFrame;
      if (!mounted) return false;
    }

    setState(() {});
    return true;
  }

  final courseprovider = Get.find<CourseController>();
  final userData = Get.find<UserController>().userdata;
  final loadingController = Get.find<BoolSetter>();
  @override
  Widget build(BuildContext context) {
    final classprovider = Provider.of<ClassController>(context);
    final q = courseprovider.coursedata
        .where((element) =>
            element.coursetype!.toLowerCase() == bottonValuetype.toLowerCase())
        .toList();
    filterdataList = searchOnchanged.isEmpty
        ? q
        : q
            .where((e) => e.name!
                .toLowerCase()
                .trim()
                .contains(searchOnchanged.toLowerCase().trim()))
            .toList();

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome \nback ${userData.name}👋",
                      style: AppTextTheme.fs20Medium,
                    ),
                    Container(
                      padding: EdgeInsets.all(2.sp),
                      height: 50.sp,
                      width: 50.sp,
                      decoration: const BoxDecoration(
                          color: AppColor.white, shape: BoxShape.circle),
                      child: userData.image.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.network(
                                userData.image,
                                fit: BoxFit.cover,
                              ))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.asset(
                                AppConfig.applogo,
                                fit: BoxFit.cover,
                              )),
                    ),
                  ],
                ),
                Gap(30.h),
                SearchTextField(
                  text: "Figma...",
                  icon: Icons.search,
                  onchanged: (v) {
                    setState(() {
                      searchOnchanged = v;
                    });
                  },
                ),
                Gap(10.h),
                SingleChildScrollView(
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
                                      bottonValuetype =
                                          (LocalData.filterlist[index]["type"])
                                              .toString();
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
                                  "${filterdataList.length} Class",
                                  style: AppTextTheme.fs14Medium
                                      .copyWith(color: AppColor.frenchGray),
                                ),
                              )
                            ],
                          ),
                          Gap(15.h),
                          filterdataList.isNotEmpty
                              ? ListView.builder(
                                  itemCount: filterdataList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.only(bottom: 15.h),
                                    child: CoursesTile(
                                      onPressed: () {
                                        Get.toNamed(
                                            RouteName.courseDetailScreen,
                                            arguments: {
                                              "id": filterdataList[index].id
                                            });
                                      },
                                      id: filterdataList[index].id!,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    "No Class",
                                    style: AppTextTheme.fs20SemiBold,
                                  ),
                                ),
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
