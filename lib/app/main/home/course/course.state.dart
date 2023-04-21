part of 'course.cubit.dart';

@immutable
abstract class CourseState extends Equatable {
  const CourseState();
}

class CourseInitial extends CourseState {
  const CourseInitial();

  @override
  List<Object> get props => [];
}

class ClassLoading extends CourseState {
  const ClassLoading();

  @override
  List<Object> get props => [];
}

class ClassLoaded extends CourseState {
  const ClassLoaded({required this.classes});

  final List<ClassData> classes;

  @override
  List<Object> get props => [classes.length];
}

class CourseLoading extends CourseState {
  const CourseLoading();

  @override
  List<Object> get props => [];
}

class CourseLoaded extends CourseState {
  const CourseLoaded({required this.courses});

  final List<Course> courses;

  @override
  List<Object> get props => [courses.length];
}

class AdmissionLoading extends CourseState {
  const AdmissionLoading();

  @override
  List<Object> get props => [];
}

class AdmissionLoaded extends CourseState {
  const AdmissionLoaded({required this.admissions});

  final List<Admission> admissions;

  @override
  List<Object> get props => [admissions.length];
}
