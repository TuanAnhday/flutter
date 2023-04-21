import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/app/components/appbar/appbar.component.dart';
import 'package:ai_care/app/main/home/class/class.cubit.dart';
import 'package:ai_care/app/main/home/class/class.module.dart';
import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:ai_care/config/application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class ClassView extends StatefulWidget {
  const ClassView({Key? key}) : super(key: key);

  @override
  State<ClassView> createState() => _ClassViewState();
}

class _ClassViewState extends State<ClassView> {
  final ClassCubit _cubit = ClassCubit();
  final _formKey = GlobalKey<FormBuilderState>();

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
        title: Text('Lớp học', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        backgroundColor: const Color(0xff07527B),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xffEAEAEA)),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          children: [
            buildTabBar(context),
            SizedBox(height: 2.h),
            BlocBuilder<ClassCubit, ClassState>(
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
                            initialValue: _cubit.classes.isNotEmpty ? _cubit.classes.first : null,
                            decoration: InputDecoration(
                                labelText: 'Chọn lớp',
                                hintText: 'Chọn lớp học',
                                suffix: GestureDetector(
                                  child: const Icon(Icons.close),
                                  onTap: () => _formKey.currentState!.fields['class']?.didChange(null),
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
                          FormBuilderDateRangePicker(
                            name: 'date_range',
                            firstDate: DateTime(1970),
                            lastDate: DateTime(2030),
                            format: DateFormat('dd-MM-yyyy'),
                            onChanged: (dynamic val) => {},
                            decoration: InputDecoration(
                              labelText: 'Khoảng thời gian',
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
                                onPressed: () => _formKey.currentState!.fields['date_range']?.didChange(null),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
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
                                  final Map<String, dynamic> params = {
                                    'studentId': Application.sharePreference.getString('studentId'),
                                    'classId': _formKey.currentState!.value['class'].id,
                                    'startDate': _formKey.currentState!.value['date_range']?.start.toString(),
                                    'endDate': _formKey.currentState!.value['date_range']?.end.toString(),
                                  };
                                  _cubit.getLessonInfoByClassIdAndStudentId(params);
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
            if (_cubit.type == ClassTab.attendance) buildAttendance(context) else buildLearning(context)
          ],
        ),
      ),
    );
  }

  Widget buildTabBar(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(180)),
      elevation: 3,
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(180),
          border: Border.all(color: Colors.white, width: 2),
        ),
        width: 90.w,
        height: 5.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              right: (_cubit.type == ClassTab.attendance) ? 45.w : 0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 42.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF464646),
                  borderRadius: BorderRadius.circular(180),
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => setState(() => _cubit.type = ClassTab.attendance),
                  child: Text(
                    'Điểm danh',
                    style: TextStyle(color: (_cubit.type == ClassTab.attendance) ? Colors.white : Colors.black87, fontSize: 12.sp),
                  ),
                ),
                SizedBox(width: 1.w),
                GestureDetector(
                  onTap: () => setState(() => _cubit.type = ClassTab.learning),
                  child: Text(
                    'Kết quả học tập',
                    style: TextStyle(color: (_cubit.type == ClassTab.learning) ? Colors.white : Colors.black87, fontSize: 12.sp),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildAttendance(BuildContext context) {
    return Expanded(
      child: BlocConsumer<ClassCubit, ClassState>(
        bloc: _cubit,
        buildWhen: (pre, now) => now is LessonInfoLoading || now is LessonInfoLoaded,
        listener: (context, state) {
          if (state is LessonInfoLoaded) {
            _cubit.getPresent();
          }
        },
        builder: (context, state) {
          return state is LessonInfoLoaded
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration:
                            BoxDecoration(border: Border.all(color: const Color(0xffD8E4EA)), color: const Color(0xff1B6086).withOpacity(0.47)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Đi học'),
                            Text('${_cubit.present}/${_cubit.lessonInfos.length}'),
                          ],
                        ),
                      ),
                      if (_cubit.present != 0)
                        Container(
                          height: 5.h,
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffD8E4EA)),
                            color: const Color(0xff7DC1E7).withOpacity(0.47),
                          ),
                          child: Row(
                            children: [
                              const Expanded(child: SizedBox()),
                              SizedBox(
                                width: 15.w,
                                child: const Text('Đi học', textAlign: TextAlign.center),
                              ),
                              SizedBox(width: 15.w, child: const Text('Có phép', textAlign: TextAlign.center)),
                            ],
                          ),
                        ),
                      ...List.generate(
                        _cubit.lessonInfos.length,
                        (index) => _cubit.lessonInfos.elementAt(index).lesson?.sessionDate != null
                            ? Container(
                                height: 3.h,
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xffD8E4EA)),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child:
                                            Text(DateFormat.yMd().format(_cubit.lessonInfos.elementAt(index).lesson?.sessionDate ?? DateTime.now()))),
                                    SizedBox(
                                      width: 15.w,
                                      child: Center(
                                        child: _cubit.lessonInfos.elementAt(index).isPresent!
                                            ? const Icon(Icons.check_circle, color: Colors.lightGreen)
                                            : const Icon(Icons.circle_outlined, color: Colors.grey),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                      child: Center(
                                        child: _cubit.lessonInfos.elementAt(index).isPermitted!
                                            ? const Icon(Icons.check_circle, color: Colors.lightGreen)
                                            : const SizedBox(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    SizedBox(height: 20.h),
                    const Center(child: Text('Không có dữ liệu')),
                  ],
                );
        },
      ),
    );
  }

  Widget buildLearning(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ClassCubit, ClassState>(
        bloc: _cubit,
        buildWhen: (pre, now) => now is LessonInfoLoading || now is LessonInfoLoaded,
        builder: (context, state) {
          return state is LessonInfoLoaded
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 5.h,
                        decoration:
                            BoxDecoration(border: Border.all(color: const Color(0xffD8E4EA)), color: const Color(0xff1B6086).withOpacity(0.47)),
                        child: Row(
                          children: [
                            SizedBox(width: 25.w, child: const Text('Ngày học', textAlign: TextAlign.center)),
                            SizedBox(width: 20.w, child: const Text('BTVN', textAlign: TextAlign.center)),
                            SizedBox(width: 20.w, child: const Text('Thái độ', textAlign: TextAlign.center)),
                            SizedBox(width: 20.w, child: const Text('Học tập', textAlign: TextAlign.center)),
                          ],
                        ),
                      ),
                      ...List.generate(
                        _cubit.lessonInfos.length,
                        (index) => _cubit.lessonInfos.elementAt(index).lesson?.sessionDate != null
                            ? Container(
                                height: 3.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: const Color(0xffD8E4EA)),
                                ),
                                child: TextButton(
                                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                                  onPressed: () {
                                    Modular.to.pushNamed(
                                      AppModule.main + NavBarModule.classPath + ClassModule.learningDetail,
                                      arguments: _cubit.lessonInfos.elementAt(index),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 25.w,
                                        child: Text(
                                          DateFormat.yMd().format(_cubit.lessonInfos.elementAt(index).lesson?.sessionDate ?? DateTime.now()),
                                          style: const TextStyle(color: Color(0xff1B6086)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                        child: Text(
                                          '${_cubit.lessonInfos.elementAt(index).score}',
                                          style: const TextStyle(color: Color(0xff1B6086)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                        child: Text(
                                          '${_cubit.lessonInfos.elementAt(index).attitude}',
                                          style: const TextStyle(color: Color(0xff1B6086)),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                        child: Text(
                                          '${_cubit.lessonInfos.elementAt(index).result}',
                                          style: const TextStyle(color: Color(0xff1B6086)),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : const SizedBox(),
                      )
                    ],
                  ),
                )
              : Column(
                  children: [
                    SizedBox(height: 20.h),
                    const Center(child: Text('Không có dữ liệu')),
                  ],
                );
        },
      ),
    );
  }
}
