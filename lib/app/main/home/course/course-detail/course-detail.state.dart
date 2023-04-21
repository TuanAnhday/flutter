part of 'course-detail.cubit.dart';

@immutable
abstract class CourseDetailState extends Equatable {
  const CourseDetailState();
}

class CourseDetailInitial extends CourseDetailState {
  const CourseDetailInitial();

  @override
  List<Object> get props => [];
}

class CoursePlanLoading extends CourseDetailState {
  const CoursePlanLoading();

  @override
  List<Object> get props => [];
}

class CoursePlanLoaded extends CourseDetailState {
  const CoursePlanLoaded({required this.coursePlan});

  final CoursePlan coursePlan;

  @override
  List<Object> get props => [coursePlan];
}
