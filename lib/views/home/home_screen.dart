import 'package:courses_app/components/all_buttons/appbutton.dart';
import 'package:courses_app/components/alltextformfield/searchtextfield.dart';
import 'package:courses_app/components/style_seet.dart';
import 'package:courses_app/components/tile/courses_tile.dart';
import 'package:courses_app/components/tile/loding_tile.dart';
import 'package:courses_app/data/localdata.dart';
import 'package:courses_app/model/all_model.dart';
import 'package:courses_app/res/services/appconfig.dart';
import 'package:courses_app/utils/routes/routes_name.dart';
import 'package:courses_app/view_model/boolsetter.dart';
import 'package:courses_app/view_model/class_viewmodel.dart';
import 'package:courses_app/view_model/course_viewmodel.dart';
import 'package:courses_app/view_model/maincourse_viewmodel.dart';
import 'package:courses_app/view_model/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
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
  List<MainCoursesModel> filterdataList = [];

  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    if (!await rebuild()) return;
    final provider = Provider.of<MaincourseViewModel>(context, listen: false);
    provider.addcourseAndclass(context);
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

  @override
  Widget build(BuildContext context) {
    final courseprovider = Provider.of<CourseViewModel>(context);
    final classprovider = Provider.of<ClassViewModel>(context);
    final loading = Provider.of<BoolSetter>(context).loading;
    final userData = Provider.of<UserViewModel>(context).userdata;
    final alldata = Provider.of<MaincourseViewModel>(context, listen: false);
    final q = alldata.maincoursedata
        .where((element) =>
            element.coursemodel.coursetype!.toLowerCase() ==
            bottonValuetype.toLowerCase())
        .toList();
    filterdataList = searchOnchanged.isEmpty
        ? q
        : q
            .where((e) => e.coursemodel.name!
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
                AppButton(
                    title: "title",
                    onPressed: () async {
                      await Fluttertoast.showToast(
                          msg: "This is Center Short Toast",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.cyan,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }),
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
                loading
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
                                        Navigator.pushNamed(context,
                                            RouteName.courseDetailScreen,
                                            arguments: filterdataList[index]);
                                      },
                                      model: filterdataList[index],
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
