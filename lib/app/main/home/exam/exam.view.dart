import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/app/components/appbar/appbar.component.dart';
import 'package:ai_care/app/main/home/exam/exam.cubit.dart';
import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../../../config/application.dart';

class ExamView extends StatefulWidget {
  const ExamView({Key? key}) : super(key: key);

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _cubit = ExamCubit();

  @override
  void initState() {
    _cubit.getClassByStudentId(Application.sharePreference.getString('studentId')!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Modular.to.navigate(AppModule.main + NavBarModule.navbar),
        ),
        title: Text('Kỳ thi', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        backgroundColor: const Color(0xff07527B),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xffEAEAEA)),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          children: [
            BlocBuilder<ExamCubit, ExamState>(
              bloc: _cubit,
              buildWhen: (pre, now) => now is ClassLoading || now is ClassLoaded,
              builder: (context, state) => state is ClassLoaded
                  ? FormBuilder(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FormBuilderDropdown(
                            name: 'class',
                            // initialValue: _cubit.classes.first,
                            decoration: InputDecoration(
                                labelText: 'Chọn lớp',
                                hintText: 'Chọn lớp học',
                                suffix: GestureDetector(
                                  child: const Icon(Icons.close),
                                  onTap: () {
                                    _formKey.currentState!.fields['class']?.didChange(null);
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                )),
                            validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: 'Chọn lớp học')]),
                            items: _cubit.classes.map((item) => DropdownMenuItem(value: item, child: Text('${item.className}'))).toList(),
                          ),
                          SizedBox(height: 2.h),
                          FormBuilderDateTimePicker(
                            name: 'examDate',
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            // initialValue: DateTime.now(),
                            inputType: InputType.date,
                            decoration: InputDecoration(
                              labelText: 'Thời gian',
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () {
                                  _formKey.currentState!.fields['examDate']?.didChange(null);
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 1.h),
                          SizedBox(
                            width: 20.w,
                            height: 5.h,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xFF5EBEF3),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.saveAndValidate()) {
                                  Map<String, dynamic> params;
                                  if (_formKey.currentState!.value['class'].className == 'Tất cả lớp học') {
                                    params = {
                                      'studentId': Application.sharePreference.getString('studentId'),
                                      'examDate': _formKey.currentState!.value['examDate']?.toString()
                                    };
                                    _cubit.getExamDetailStudent(params);
                                  } else {
                                    params = {
                                      'studentId': Application.sharePreference.getString('studentId'),
                                      'classId': _formKey.currentState!.value['class'].id,
                                      'examDate': _formKey.currentState!.value['examDate']?.toString()
                                    };
                                  }
                                  _cubit.getExamDetailStudent(params);
                                }
                              },
                              child: Text('Xem', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
            BlocBuilder<ExamCubit, ExamState>(
                bloc: _cubit,
                buildWhen: (pre, now) => now is ExamDetailStudentLoading || now is ExamDetailStudentLoaded,
                builder: (context, state) => state is ExamDetailStudentLoaded
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(
                              _cubit.examDetailStudents.length,
                              (index) => Row(
                                children: [
                                  Container(
                                    height: 10.h,
                                    width: 30.w,
                                    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                    margin: EdgeInsets.only(bottom: 1.h),
                                    decoration: BoxDecoration(
                                      color: Colors.lightGreen,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.blueAccent),
                                    ),
                                    child: Center(child: Text(DateFormat.yMd().format(_cubit.examDetailStudents.elementAt(index).examDate!))),
                                  ),
                                  SizedBox(width: 1.w),
                                  Expanded(
                                    child: Container(
                                      height: 10.h,
                                      margin: EdgeInsets.only(bottom: 1.h),
                                      decoration: BoxDecoration(
                                          color: Colors.lightGreen,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(color: Colors.blueAccent)),
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('${_cubit.examDetailStudents.elementAt(index).examDetail?.exam?.name}'),
                                          Text(
                                              'Thời gian: ${_cubit.examDetailStudents.elementAt(index).examDetail?.exam?.examHour}, ${DateFormat.yMd().format(_cubit.examDetailStudents.elementAt(index).examDate!)}'),
                                          Text(
                                              'Lớp: ${_cubit.examDetailStudents.elementAt(index).examDetail?.exam?.classData?.className ?? 'Không'}'),
                                          // const Text('Trạng thái:'),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(height: 20.h),
                          const Center(child: Text('Không có dữ liệu')),
                        ],
                      ))
          ],
        ),
      ),
    );
  }
}
