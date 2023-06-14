import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/app/components/appbar/appbar.component.dart';
import 'package:ai_care/app/main/home/course/course-detail/course-detail.cubit.dart';
import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:ai_care/models/class/class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../../../models/course-plan/course_plan.dart';
import '../../../../../models/course/course.dart';

class CourseDetailView extends StatefulWidget {
  const CourseDetailView({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  State<CourseDetailView> createState() => _CourseDetailViewState();
}

class _CourseDetailViewState extends State<CourseDetailView> {
  final CourseDetailCubit _cubit = CourseDetailCubit();

  @override
  void initState() {
    _cubit.getCoursePlan(widget.course.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () =>
              Modular.to.navigate(AppModule.main + NavBarModule.course),
        ),
        title: Text(widget.course.courseName!,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        backgroundColor: const Color(0xff07527B),
      ),
      body: Container(
        color: const Color(0xffEAEAEA),
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
        child: Column(
          children: [
            buildTabBar(context),
            SizedBox(height: 1.h),
            Expanded(child: buildBody()),
          ],
        ),
      ),
    );
  }

  Widget buildTabBar(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(180)),
      elevation: 3,
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(180),
          border: Border.all(color: Colors.white, width: 2),
        ),
        width: 90.w,
        height: 5.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              right: _cubit.type == CourseDetailTab.courseInfo
                  ? 61.w
                  : _cubit.type == CourseDetailTab.coursePlan
                      ? 30.w
                      : 0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 28.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF464646),
                  borderRadius: BorderRadius.circular(180),
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () =>
                      setState(() => _cubit.type = CourseDetailTab.courseInfo),
                  child: Text(
                    'Thông tin',
                    style: TextStyle(
                        color: (_cubit.type == CourseDetailTab.courseInfo)
                            ? Colors.white
                            : Colors.black87,
                        fontSize: 12.sp),
                  ),
                ),
                SizedBox(width: 1.w),
                GestureDetector(
                  onTap: () =>
                      setState(() => _cubit.type = CourseDetailTab.coursePlan),
                  child: Text(
                    'Lộ trình',
                    style: TextStyle(
                        color: (_cubit.type == CourseDetailTab.coursePlan)
                            ? Colors.white
                            : Colors.black87,
                        fontSize: 12.sp),
                  ),
                ),
                SizedBox(width: 1.w),
                GestureDetector(
                  onTap: () =>
                      setState(() => _cubit.type = CourseDetailTab.classInfo),
                  child: Text(
                    'Lớp học',
                    style: TextStyle(
                        color: (_cubit.type == CourseDetailTab.classInfo)
                            ? Colors.white
                            : Colors.black87,
                        fontSize: 12.sp),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    switch (_cubit.type) {
      case CourseDetailTab.courseInfo:
        return buildCourseInfo();
      case CourseDetailTab.coursePlan:
        return buildCoursePlan();
      case CourseDetailTab.classInfo:
        return buildClassInfo();
      default:
        return buildCourseInfo();
    }
  }

  Widget buildCourseInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.course.description ?? "Chưa có dữ liệu"),
        SizedBox(height: 1.h),
        ElevatedButton(onPressed: () => {}, child: Text('Đăng ký học')),
      ],
    );
  }

  Widget buildCoursePlan() {
    return BlocBuilder(
      bloc: _cubit,
      buildWhen: (pre, now) =>
          now is CoursePlanLoading || now is CoursePlanLoaded,
      builder: (context, state) => state is CoursePlanLoaded &&
              _cubit.coursePlan.id != null
          ? SingleChildScrollView(
              child: Column(
                children: List.generate(
                    _cubit.coursePlan.coursePlanDetails!.length,
                    (index) => Card(
                          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            ),
                            onPressed: () {},
                            child: SizedBox(
                              width: 100.w,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 1.h),
                                    Text(
                                      'Buổi: ${_cubit.coursePlan.coursePlanDetails?.elementAt(index).lesson}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Text(
                                      'Chủ đề: ${_cubit.coursePlan.coursePlanDetails?.elementAt(index).topic}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Text(
                                      'Nội dung trên lớp: ${_cubit.coursePlan.coursePlanDetails?.elementAt(index).content}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(height: 0.5.h),
                                    Text(
                                      'Bài tập về nhà: ${_cubit.coursePlan.coursePlanDetails?.elementAt(index).homework}',
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(height: 1.h),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
              ),
            )
          : const Center(
              child: Text('Chưa có dữ liệu'),
            ),
    );
  }

  Widget buildClassInfo() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(widget.course.classes!.length, (index) {
          return Card(
            elevation: 3,
            child: ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                widget.course.classes?.elementAt(index).className ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(_cubit.classInfoTitles.elementAt(0),
                                  overflow: TextOverflow.ellipsis, maxLines: 1),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: LinearPercentIndicator(
                                animation: true,
                                lineHeight: 20,
                                animationDuration: 250,
                                percent: widget.course.classes!
                                        .elementAt(index)
                                        .lessons!
                                        .isEmpty
                                    ? 0
                                    : ((widget.course.classes!
                                            .elementAt(index)
                                            .lessons!
                                            .where((element) =>
                                                element.isAttendance == true)
                                            .length) /
                                        (widget.course.classes!
                                            .elementAt(index)
                                            .lessons!
                                            .length)),
                                center: Text(widget.course.classes!
                                        .elementAt(index)
                                        .lessons!
                                        .isEmpty
                                    ? '0/0'
                                    : '${widget.course.classes!.elementAt(index).lessons!.where((element) => element.isAttendance == true).length}/${widget.course.classes!.elementAt(index).lessons!.length}'),
                                barRadius: const Radius.circular(10),
                                progressColor: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(_cubit.classInfoTitles.elementAt(1),
                                  overflow: TextOverflow.ellipsis, maxLines: 1),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(widget.course.classes
                                          ?.elementAt(index)
                                          .startDate !=
                                      null
                                  ? DateFormat.yMd().format(widget
                                      .course.classes!
                                      .elementAt(index)
                                      .startDate!)
                                  : 'Chưa xác định'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(_cubit.classInfoTitles.elementAt(2),
                                  overflow: TextOverflow.ellipsis, maxLines: 1),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(widget.course.classes
                                          ?.elementAt(index)
                                          .endDate !=
                                      null
                                  ? DateFormat.yMd().format(widget
                                      .course.classes!
                                      .elementAt(index)
                                      .endDate!)
                                  : 'Chưa xác định'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(_cubit.classInfoTitles.elementAt(3),
                                  overflow: TextOverflow.ellipsis, maxLines: 2),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                '${widget.course.classes?.elementAt(index).classSchedules?.map((e) => '${_cubit.convertDayOfWeek(e.dayOfWeek)} - ${e.startTime}').toSet().join(', ')}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                _cubit.classInfoTitles.elementAt(4),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                '${widget.course.classes?.elementAt(index).classSchedules?.map((e) => '${e.teachers?.map((t) => t.employee?.user?.fullName ?? 'Không có dữ liệu').join(', ')}').toSet().join(', ')}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                _cubit.classInfoTitles.elementAt(5),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                '${widget.course.classes?.elementAt(index).studentInClass ?? 0} học viên',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                _cubit.classInfoTitles.elementAt(6),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Text(
                                '${widget.course.classes?.elementAt(index).classSchedules?.map((e) => e.classroom?.name ?? "Không có dữ liệu").toSet().join(', ')}',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
