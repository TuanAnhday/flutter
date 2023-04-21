import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/app/main/home/class/learning/learning-detail.cubit.dart';
import 'package:ai_care/app/main/home/home.cubit.dart';
import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:ai_care/config/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/cache_data.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final data = [
    {'title': 'Lịch học', 'imageUrl': 'assets/images/home/icon/calendar.svg', 'color': '0XFFE19C34', 'route': AppModule.main + NavBarModule.schedule},
    {'title': 'Lớp học', 'imageUrl': 'assets/images/home/icon/class.svg', 'color': '0XFFA26ABD', 'route': AppModule.main + NavBarModule.classPath},
    {'title': 'Kỳ thi', 'imageUrl': 'assets/images/home/icon/exam.svg', 'color': '0XFF1B5081', 'route': AppModule.main + NavBarModule.exam},
    {'title': 'E-Learning', 'imageUrl': 'assets/images/home/icon/headset.svg', 'color': '0XFFE06058', 'route': ''},
    {'title': 'Báo cáo', 'imageUrl': 'assets/images/home/icon/analysis.svg', 'color': '0XFFA26ABD', 'route': AppModule.main + NavBarModule.report},
    {'title': 'Tài chính', 'imageUrl': 'assets/images/home/icon/finance.svg', 'color': '0XFFE06058', 'route': AppModule.main + NavBarModule.finance},
    {'title': 'Khảo sát', 'imageUrl': 'assets/images/home/icon/survey.svg', 'color': '0XFFE19C34', 'route': ''},
    {'title': 'Khoá học', 'imageUrl': 'assets/images/home/icon/course.svg', 'color': '0XFF1B5081', 'route': AppModule.main + NavBarModule.course},
  ];
  final ScrollController _scrollController = ScrollController();
  final HomeCubit _cubit = HomeCubit();
  final LearningDetailCubit _learnDetailCubit = LearningDetailCubit();

  @override
  void initState() {
    _scrollController.addListener(() => _cubit.scrollListener(_scrollController));
    _learnDetailCubit
        .getStudent(Application.sharePreference.getString('studentId')!)
        .whenComplete(() => CacheData.setStudent(_learnDetailCubit.student));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _appBar(context),
          _menu(context),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: const Color(0xff07527B),
            expandedHeight: 25.h,
            flexibleSpace: FlexibleSpaceBar(
              title: SingleChildScrollView(
                child: Column(
                  children: [
                    BlocBuilder<LearningDetailCubit, LearningDetailState>(
                      bloc: _learnDetailCubit,
                      buildWhen: (pre, now) => now is StudentLoaded || now is StudentLoading,
                      builder: (context, state) => state is StudentLoaded
                          ? Text(
                              'Học viên ${_learnDetailCubit.student.name}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 9.sp),
                            )
                          : const SizedBox(),
                    ),
                    SizedBox(height: 1.h),
                    // Text(
                    //   'Bạn có lịch học lớp Smartkid 01 vào lúc 18:00 hôm nay',
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(fontSize: 7.sp, fontWeight: FontWeight.w300),
                    // ),
                    SizedBox(height: 7.h),
                  ],
                ),
              ),
              centerTitle: true,
              background: Image.asset('assets/images/home/appbar/appbar.png', fit: BoxFit.cover),
            ),
          ),
        ];
      },
      // body widgets
      body: Container(
        color: const Color(0xff07527B),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Color(0xffEAEAEA),
          ),
        ),
      ),
    );
  }

  Widget _menu(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: _cubit,
      builder: (context, state) {
        return AnimatedPositioned(
          top: 20.h - _cubit.scrollOffset,
          left: 2.5.w,
          duration: const Duration(),
          curve: Curves.fastLinearToSlowEaseIn,
          child: Container(
            width: 95.w,
            height: 30.h,
            // height: 30.h,
            // padding: EdgeInsets.only(top: 5.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              color: const Color(0xffF0F4F8),
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 4.w, crossAxisSpacing: 15),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        if (data[index]['route']! != '') {
                          Modular.to.navigate(data[index]['route']!);
                        } else {
                          Application.toast.showToastNotification('Tính năng đang được phát triển');
                        }
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          color: Color(int.parse(data[index]['color'] as String)),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: SvgPicture.asset(data[index]['imageUrl']!, width: 25.sp, height: 25.sp, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        data[index]['title']!,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
