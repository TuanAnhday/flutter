part of 'exam.cubit.dart';

@immutable
abstract class ExamState extends Equatable {
  const ExamState();
}

class ExamInitial extends ExamState {
  const ExamInitial();

  @override
  List<Object> get props => [];
}

class ClassLoading extends ExamState {
  const ClassLoading();

  @override
  List<Object> get props => [];
}

class ClassLoaded extends ExamState {
  const ClassLoaded({required this.classes});

  final List<ClassData> classes;

  @override
  List<Object> get props => [classes.length];
}

class ExamLoading extends ExamState {
  const ExamLoading();

  @override
  List<Object> get props => [];
}

class ExamLoaded extends ExamState {
  const ExamLoaded({required this.exams});

  final List<Exam> exams;

  @override
  List<Object> get props => [exams.length];
}

class ExamDetailLoading extends ExamState {
  const ExamDetailLoading();

  @override
  List<Object> get props => [];
}

class ExamDetailLoaded extends ExamState {
  const ExamDetailLoaded({required this.examDetails});

  final List<ExamDetail> examDetails;

  @override
  List<Object> get props => [examDetails.length];
}

class ExamDetailStudentLoading extends ExamState {
  const ExamDetailStudentLoading();

  @override
  List<Object> get props => [];
}

class ExamDetailStudentLoaded extends ExamState {
  const ExamDetailStudentLoaded({required this.examDetailStudents});

  final List<ExamDetailStudent> examDetailStudents;

  @override
  List<Object> get props => [examDetailStudents.length];
}
