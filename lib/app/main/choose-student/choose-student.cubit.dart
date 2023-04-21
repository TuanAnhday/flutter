import 'package:ai_care/config/application.dart';
import 'package:ai_care/models/student/student.dart';
import 'package:ai_care/services/student/student.service.dart';
import 'package:ai_care/utils/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'choose-student.state.dart';

class ChooseStudentCubit extends Cubit<ChooseStudentState> {
  ChooseStudentCubit() : super(const ChooseStudentInitial()){
    getStudentsByParent(Application.sharePreference.getString('userId')!);
  }
  final StudentService _studentService = StudentService();
  List<Student> students = <Student>[];

  Future<void> getStudentsByParent(String parentId) async {
    emit(const StudentLoading());
    final params = {'parentId': parentId};
    try{
      final data = await _studentService.getAllByParent(params);
      students = data;
      emit(StudentLoaded(students: data));
    }on NetworkException {
      // final message = e.message['message'] != null ? "${e.message["message"]}" : "";
      // Application.toast.showToastFailed(message);
      emit(const StudentLoaded(students: <Student>[]));
    }

  }
}
