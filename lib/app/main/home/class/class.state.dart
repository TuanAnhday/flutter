part of 'class.cubit.dart';

@immutable
abstract class ClassState extends Equatable {
  const ClassState();
}

class ClassInitial extends ClassState {
  const ClassInitial();

  @override
  List<Object> get props => [];
}

class ClassLoading extends ClassState {
  const ClassLoading();

  @override
  List<Object> get props => [];
}

class ClassLoaded extends ClassState {
  const ClassLoaded({required this.classes});

  final List<ClassData> classes;

  @override
  List<Object> get props => [classes.length];
}

class LessonInfoLoading extends ClassState {
  const LessonInfoLoading();

  @override
  List<Object> get props => [];
}

class LessonInfoLoaded extends ClassState {
  const LessonInfoLoaded({required this.lessonInfos});

  final List<LessonInfo> lessonInfos;

  @override
  List<Object> get props => [lessonInfos.length];
}

class LearningLoading extends ClassState {
  const LearningLoading();

  @override
  List<Object> get props => [];
}

class LearningLoaded extends ClassState {
  const LearningLoaded({required this.learningClass});

  final LearningClass learningClass;

  @override
  List<Object> get props => [learningClass];
}
