part of './schedule.cubit.dart';

@immutable
abstract class ScheduleState extends Equatable {
  const ScheduleState();
}

class ScheduleInitial extends ScheduleState {
  const ScheduleInitial();

  @override
  List<Object> get props => [];
}

class ClassLoading extends ScheduleState {
  const ClassLoading();

  @override
  List<Object> get props => [];
}

class ClassLoaded extends ScheduleState {
  const ClassLoaded({required this.classes});

  final List<ClassData> classes;

  @override
  List<Object> get props => [classes.length];
}

class ActivityLoading extends ScheduleState {
  const ActivityLoading();

  @override
  List<Object> get props => [];
}

class ActivityLoaded extends ScheduleState {
  const ActivityLoaded({required this.activities});

  final List<Activity> activities;

  @override
  List<Object> get props => [activities];
}
