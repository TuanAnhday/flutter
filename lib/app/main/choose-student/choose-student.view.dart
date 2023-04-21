import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/app/main/choose-student/choose-student.cubit.dart';
import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:ai_care/config/application.dart';
import 'package:ai_care/resources/cache_data.dart';
import 'package:ai_care/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sizer/sizer.dart';

class ChooseStudentView extends StatefulWidget {
  const ChooseStudentView({Key? key}) : super(key: key);

  @override
  State<ChooseStudentView> createState() => _ChooseStudentViewState();
}

class _ChooseStudentViewState extends State<ChooseStudentView> {
  final ChooseStudentCubit _cubit = ChooseStudentCubit();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Image(image: AssetImage('assets/images/login/login.png')),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: buildBody(context),
        ),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.h),
        Row(
          children: [
            Text(
              'Chọn học viên',
              style: TextStyle(fontSize: 20.sp, color: const Color(0xff33779C), fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        BlocBuilder(
          bloc: _cubit,
          buildWhen: (pre, now) => now is StudentLoading || now is StudentLoaded,
          builder: (context, state) => state is StudentLoaded
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                            _cubit.students.length,
                            (index) => TextButton(
                                  onPressed: () {
                                    Application.sharePreference.putString('studentId', _cubit.students.elementAt(index).id!);
                                    CacheData.setStudent(_cubit.students.elementAt(index));
                                    Modular.to.navigate(AppModule.main + NavBarModule.navbar);
                                  },
                                  child: Row(
                                    children: [
                                      if (_cubit.students.elementAt(index).studentInfo?.user?.imageUrl != null)
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                            '${API.baseUrl}/${_cubit.students.elementAt(index).studentInfo?.user?.imageUrl}',
                                          ),
                                          backgroundColor: Colors.white,
                                          radius: 3.5.w,
                                        ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _cubit.students.elementAt(index).name,
                                            style: TextStyle(fontWeight: FontWeight.bold, color: const Color(0xff1B6086), fontSize: 15.sp),
                                          ),
                                          Text(
                                            _cubit.students.elementAt(index).studentInfo?.tenant?.name ?? '',
                                            style: TextStyle(fontWeight: FontWeight.w300, color: const Color(0xff1B6086), fontSize: 9.sp),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                      ],
                    ),
                  ),
                )
              : const Expanded(child: Center(child: CircularProgressIndicator())),
        )
      ],
    );
  }
}
