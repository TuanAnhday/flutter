import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../themes/style.dart';

class TuitionView extends StatefulWidget {
  const TuitionView({Key? key}) : super(key: key);

  @override
  State<TuitionView> createState() => _TuitionViewState();
}

class _TuitionViewState extends State<TuitionView> {
  final data = [
    {
      'title': 'Thông báo đóng học phí kỳ 2 lớp Smartkids 01',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    },
    {
      'title': 'Thông báo đóng học phí kỳ 2 lớp Smartkids 01',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    },
    {
      'title': 'Thông báo đóng học phí kỳ 2 lớp Smartkids 01',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    },
    {
      'title': 'Thông báo đóng học phí kỳ 2 lớp Smartkids 01',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    },
    {
      'title': 'Thông báo đóng học phí kỳ 2 lớp Smartkids 01',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    },
    {
      'title': 'Thông báo đóng học phí kỳ 2 lớp Smartkids 01',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(
            data.length,
            (index) => Container(
              width: 90.w,
              margin: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: const Color(0xffB8CED9))),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${data.elementAt(index)['title']}',
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp, color: AppColor.defaultColor),
                    ),
                    SizedBox(height: 2.h),
                    // Text(
                    //   '${data.elementAt(index)['content']}',
                    //   style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.sp, color: AppColor.defaultColor),
                    // ),
                    Text(
                      '${data.elementAt(index)['time']}',
                      style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.sp, color: AppColor.defaultColor),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
