import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/app/components/appbar/appbar.component.dart';
import 'package:ai_care/app/main/home/report/report.cubit.dart';
import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  final ReportCubit _cubit = ReportCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Modular.to.navigate(AppModule.main + NavBarModule.navbar),
        ),
        title: Text('Báo cáo', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        backgroundColor: const Color(0xff07527B),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Color(0xffEAEAEA)),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        child: Column(
          children: [
            buildTabBar(context),
            SizedBox(height: 2.h),
            // BlocBuilder<ClassCubit, ClassState>(
            //   bloc: _cubit,
            //   buildWhen: (pre, now) => now is ClassLoading || now is ClassLoaded,
            //   builder: (context, state) => state is ClassLoaded
            //       ? FormBuilder(
            //     key: _formKey,
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         FormBuilderDropdown(
            //           name: 'class',
            //           initialValue: _cubit.classes.isNotEmpty ? _cubit.classes.first : null,
            //           decoration: InputDecoration(
            //               labelText: 'Chọn lớp',
            //               hintText: 'Chọn lớp học',
            //               suffix: GestureDetector(
            //                 child: const Icon(Icons.close),
            //                 onTap: () => _formKey.currentState!.fields['class']?.didChange(null),
            //               ),
            //               enabledBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.blue),
            //                 borderRadius: BorderRadius.circular(15),
            //               ),
            //               focusedBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.red),
            //                 borderRadius: BorderRadius.circular(15),
            //               ),
            //               errorBorder: OutlineInputBorder(
            //                 borderSide: const BorderSide(color: Colors.red),
            //                 borderRadius: BorderRadius.circular(15),
            //               )),
            //           validator: FormBuilderValidators.compose([FormBuilderValidators.required(errorText: 'Chọn lớp học')]),
            //           items: _cubit.classes.map((item) => DropdownMenuItem(value: item, child: Text('${item.className}'))).toList(),
            //         ),
            //         SizedBox(height: 2.h),
            //         FormBuilderDateRangePicker(
            //           name: 'date_range',
            //           firstDate: DateTime(1970),
            //           lastDate: DateTime(2030),
            //           format: DateFormat('dd-MM-yyyy'),
            //           onChanged: (dynamic val) => {},
            //           decoration: InputDecoration(
            //             labelText: 'Khoảng thời gian',
            //             enabledBorder: OutlineInputBorder(
            //               borderSide: const BorderSide(color: Colors.blue),
            //               borderRadius: BorderRadius.circular(15),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               borderSide: const BorderSide(color: Colors.red),
            //               borderRadius: BorderRadius.circular(15),
            //             ),
            //             suffixIcon: IconButton(
            //               icon: const Icon(Icons.close),
            //               onPressed: () => _formKey.currentState!.fields['date_range']?.didChange(null),
            //             ),
            //           ),
            //         ),
            //         SizedBox(height: 2.h),
            //         SizedBox(
            //           width: 20.w,
            //           height: 5.h,
            //           child: TextButton(
            //             style: TextButton.styleFrom(
            //               backgroundColor: const Color(0xFF5EBEF3),
            //               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
            //             ),
            //             onPressed: () {
            //               if (_formKey.currentState!.saveAndValidate()) {
            //                 final Map<String, dynamic> params = {
            //                   'studentId': Application.sharePreference.getString('studentId'),
            //                   'classId': _formKey.currentState!.value['class'].id,
            //                   'startDate': _formKey.currentState!.value['date_range']?.start.toString(),
            //                   'endDate': _formKey.currentState!.value['date_range']?.end.toString(),
            //                 };
            //                 _cubit.getLessonInfoByClassIdAndStudentId(params);
            //               }
            //             },
            //             child: Text('Xem', style: TextStyle(color: Colors.white, fontSize: 12.sp)),
            //           ),
            //         ),
            //         SizedBox(height: 1.h),
            //       ],
            //     ),
            //   )
            //       : const Center(child: CircularProgressIndicator()),
            // ),
            // if (_cubit.type == ClassTab.attendance) buildAttendance(context) else buildLearning(context)
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
              right: (_cubit.type == ReportTab.classData) ? 45.w : 0,
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
                  onTap: () => setState(() => _cubit.type = ReportTab.classData),
                  child: Text(
                    'Điểm danh',
                    style: TextStyle(color: (_cubit.type == ReportTab.classData) ? Colors.white : Colors.black87, fontSize: 12.sp),
                  ),
                ),
                SizedBox(width: 1.w),
                GestureDetector(
                  onTap: () => setState(() => _cubit.type = ReportTab.eLearning),
                  child: Text(
                    'Kết quả học tập',
                    style: TextStyle(color: (_cubit.type == ReportTab.eLearning) ? Colors.white : Colors.black87, fontSize: 12.sp),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
