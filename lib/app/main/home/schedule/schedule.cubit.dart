import 'package:ai_care/models/activity/activity.dart';
import 'package:ai_care/models/class/class.dart';
import 'package:ai_care/services/activity/activity.service.dart';
import 'package:ai_care/services/class/class.service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'schedule.state.dart';

class ScheduleCubit extends Cubit<ScheduleState> {
  ScheduleCubit() : super(const ScheduleInitial());

  List<ClassData> classes = <ClassData>[];
  ClassData classStudent = ClassData();
  final ClassService _classService = ClassService();
  final ActivityService _activityService = ActivityService();
  List<Activity> activities = <Activity>[];
  List<Activity> activitiesInClass = <Activity>[];

  Future<void> getClassByStudentId(String studentId) async {
    emit(const ClassLoading());
    final data = await _classService.getClassByStudentId(studentId);
    classes = data;
    if (classes.length == 1) {
      classStudent = classes.first;
      getActivitiesByClassAndDate({'classId': classStudent.id, 'date': DateTime.now().toString()});
    }
    emit(ClassLoaded(classes: classes));
  }

  Future<void> getActivitiesByClassAndDate(Map<String, dynamic> params) async {
    emit(const ActivityLoading());
    final data = await _activityService.getByClassAndDate(params);
    activitiesInClass = data;
    emit(ActivityLoaded(activities: activitiesInClass));
  }

  Future<void> getActivitiesByClassId(String classId) async {
    emit(const ActivityLoading());
    final data = await _activityService.getByClassId(classId);
    activities = data;
    emit(ActivityLoaded(activities: activities));
  }


}
