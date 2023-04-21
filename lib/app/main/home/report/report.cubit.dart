import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'report.state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(const ReportInitial());
  ReportTab type = ReportTab.classData;
}

enum ReportTab { classData, eLearning }
