import 'package:ai_care/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class WalletVoucherView extends StatefulWidget {
  const WalletVoucherView({Key? key}) : super(key: key);

  @override
  State<WalletVoucherView> createState() => _WalletVoucherViewState();
}

class _WalletVoucherViewState extends State<WalletVoucherView> {
  final data = [
    {
      'title': 'Giảm 20% khoá học',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    },
    {
      'title': 'Giảm 20% khoá học',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    },
    {
      'title': 'Giảm 20% khoá học',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    },
    {
      'title': 'Giảm 20% khoá học',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    },
    {
      'title': 'Giảm 20% khoá học',
      'content': 'Cho khoá học từ 3 tháng',
      'time': 'Hạn đến ngày 30/12/2021',
    },
    {
      'title': 'Giảm 20% khoá học',
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
          Text(
            'Voucher của tôi',
            style: TextStyle(color: const Color(0xff1B6086), fontWeight: FontWeight.w700, fontSize: 14.sp),
          ),
          SizedBox(height: 1.h),
          ...List.generate(
            data.length,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 65.sp,
                    width: 70.sp,
                    decoration: BoxDecoration(color: const Color(0xffB8CED9), borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(5),
                    child: SvgPicture.asset('assets/images/home/finance/voucher.svg', width: 20.w),
                  ),
                  Container(
                    height: 65.sp,
                    width: 66.w,
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
                        Text(
                          '${data.elementAt(index)['content']}',
                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.sp, color: AppColor.defaultColor),
                        ),
                        Text(
                          '${data.elementAt(index)['time']}',
                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 10.sp, color: AppColor.defaultColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
