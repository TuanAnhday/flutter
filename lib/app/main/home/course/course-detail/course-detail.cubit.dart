import 'package:ai_care/models/course-plan/course_plan.dart';
import 'package:ai_care/services/course-plan/course-plan.service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'course-detail.state.dart';

class CourseDetailCubit extends Cubit<CourseDetailState> {
  CourseDetailCubit() : super(const CourseDetailInitial());
  final CoursePlanService _coursePlanService = CoursePlanService();
  late CoursePlan coursePlan;
  CourseDetailTab type = CourseDetailTab.courseInfo;
  List<String> classInfoTitles = ['Số buổi đã học', 'Ngày bắt đầu', 'Ngày kết thúc', 'Thời khoá biểu', 'Giáo viên', 'Số học viên', 'Phòng học'];

  String convertDayOfWeek(int? dayOfWeek) {
    switch (dayOfWeek) {
      case 0:
        return 'Chủ nhật';
      case 1:
        return 'Thứ 2';
      case 2:
        return 'Thứ 3';
      case 3:
        return 'Thứ 4';
      case 4:
        return 'Thứ 5';
      case 5:
        return 'Thứ 6';
      case 6:
        return 'Thứ 7';
      default:
        return 'Chưa xác định';
    }
  }

  Future<void> getCoursePlan(String courseId) async {
    emit(const CoursePlanLoading());
    try {
      final result = await _coursePlanService.getByCourseId(courseId);
      coursePlan = result;
    } catch (e) {
      coursePlan = CoursePlan();
    }

    emit(CoursePlanLoaded(coursePlan: coursePlan));
  }
}

enum CourseDetailTab { courseInfo, coursePlan, classInfo }
