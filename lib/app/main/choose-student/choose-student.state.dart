part of 'choose-student.cubit.dart';

abstract class ChooseStudentState extends Equatable {
  const ChooseStudentState();
}

class ChooseStudentInitial extends ChooseStudentState {
  const ChooseStudentInitial();

  @override
  List<Object> get props => [];
}

class StudentLoading extends ChooseStudentState {
  const StudentLoading();

  @override
  List<Object> get props => [];
}

class StudentLoaded extends ChooseStudentState {

  const StudentLoaded({required this.students});
  final List<Student> students;

  @override
  List<Object> get props => [students.length];
}
