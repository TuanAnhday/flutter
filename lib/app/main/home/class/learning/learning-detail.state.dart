part of 'learning-detail.cubit.dart';

@immutable
abstract class LearningDetailState extends Equatable {
  const LearningDetailState();
}

class LearningDetailInit extends LearningDetailState {
  const LearningDetailInit();

  @override
  List<Object> get props => [];
}

class StudentLoading extends LearningDetailState {
  const StudentLoading();

  @override
  List<Object> get props => [];
}

class StudentLoaded extends LearningDetailState {
  const StudentLoaded({required this.student});

  final Student student;

  @override
  List<Object> get props => [];
}
