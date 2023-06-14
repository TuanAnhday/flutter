import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/app/components/appbar/appbar.component.dart';
import 'package:ai_care/app/main/home/course/course.cubit.dart';
import 'package:ai_care/app/main/home/course/course.module.dart';
import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:ai_care/config/application.dart';
import 'package:ai_care/models/class/class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sizer/sizer.dart';
import 'package:intl/intl.dart';

import '../../../../models/admission/admission.dart';

class CourseView extends StatefulWidget {
  const CourseView({Key? key}) : super(key: key);

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _cubit = CourseCubit();

  @override
  void initState() {
    super.initState();
    _cubit
        .getAdmissionByStudentId(
            Application.sharePreference.getString('studentId')!)
        .whenComplete(() => _cubit.getCoursesHaveTrainingCenterWithStudent(
            Application.sharePreference.getString('studentId')!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () =>
              Modular.to.navigate(AppModule.main + NavBarModule.navbar),
        ),
        title: Text('Khoá học',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        backgroundColor: const Color(0xff07527B),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 1.h),
            Text('Danh sách khoá học',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.sp,
                    color: const Color(0xFF1B6086))),
            SizedBox(height: 1.h),
            FormBuilder(
              key: _formKey,
              child: FormBuilderTextField(
                name: 'search',
                decoration: InputDecoration(
                  labelText: 'Tìm kiếm',
                  labelStyle: const TextStyle(color: Color(0xFF6FADC8)),
                  fillColor: const Color(0xFFC4C4C4).withOpacity(0.1),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Color(0xFF6FADC8)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  contentPadding:
                      const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                  suffixIcon: const Icon(Icons.search,
                      color: Color(0xFF2F4D87), size: 24),
                ),
                onChanged: (val) {
                  final params = {'keyword': val};
                  Future.delayed(
                      const Duration(milliseconds: 500),
                      () => _cubit.getCoursesHaveTrainingCenterWithStudent(
                          Application.sharePreference.getString('studentId')!,
                          params: params));
                },
                textInputAction: TextInputAction.next,
              ),
            ),
            SizedBox(height: 1.h),
            buildBody()
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return BlocBuilder(
      bloc: _cubit,
      buildWhen: (pre, now) => now is CourseLoading || now is CourseLoaded,
      builder: (context, state) => state is CourseLoaded
          ? Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                      _cubit.courses.length,
                      (index) => Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor:
                                      const Color.fromRGBO(234, 247, 254, 1)),
                              onPressed: () {
                                Modular.to.pushNamed(
                                  AppModule.main +
                                      NavBarModule.course +
                                      CourseModule.courseDetail,
                                  arguments: _cubit.courses.elementAt(index),
                                );
                                // print(_cubit.courses.elementAt(index).classes?.map((e) => e.toJson()));
                              },
                              child: SizedBox(
                                width: 100.w,
                                height: 10.h,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 30.w,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Image.asset(
                                            'assets/images/home/course/course.png',
                                            width: 30.sp),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${_cubit.courses.elementAt(index).courseName}',
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            'Trạng thái: ${getClassStatus(_cubit.admissions.firstWhere((element) => element.courseId == _cubit.courses.elementAt(index).id, orElse: () => Admission()).classData?.classStatus)} ',
                                            style: TextStyle(
                                                fontSize: 9.sp,
                                                color: const Color(0xff84888B)),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                              'Thời lượng: ${_cubit.courses.elementAt(index).numberOfSession}  buổi',
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  color:
                                                      const Color(0xff84888B))),
                                          const SizedBox(height: 3),
                                          Text(
                                              'Giá: ${NumberFormat('#,###.###').format((_cubit.courses.elementAt(index).price ?? 0) * (_cubit.courses.elementAt(index).numberOfSession ?? 0))}đ',
                                              style: TextStyle(
                                                  fontSize: 9.sp,
                                                  color:
                                                      const Color(0xff84888B))),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: 15.w,
                                    //   child: Center(
                                    //     child: CircularPercentIndicator(
                                    //       radius: 6.w,
                                    //       percent: _cubit.classes.elementAt(index).lessons!.where((element) => element.isAttendance == true).length /
                                    //           _cubit.classes.elementAt(index).lessons!.length,
                                    //       center: Text(
                                    //           '${(_cubit.classes.elementAt(index).lessons!.where((element) => element.isAttendance == true).length * 100 / _cubit.classes.elementAt(index).lessons!.length).toStringAsFixed(2)} %',
                                    //           style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold)),
                                    //       progressColor: Colors.green,
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          )),
                ),
              ),
            )
          : Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Loading...'),
                  ],
                ),
              ),
            ),
    );
  }

  String getClassStatus(int? classStatus) {
    switch (classStatus) {
      case 0:
        return 'Lớp chờ';
      case 1:
        return 'Lớp đang học';
      case 2:
        return 'Lớp hoàn thành';
      case 3:
        return 'Lớp đã huỷ';
      case 4:
        return 'Lớp tạm hoãn';
      default:
        return 'Chưa học';
    }
  }
}
