import 'package:ai_care/app/components/appbar/appbar.component.dart';
import 'package:ai_care/models/lesson-info/lesson_info.dart';
import 'package:ai_care/resources/cache_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class LearningDetailView extends StatefulWidget {
  const LearningDetailView({Key? key, required this.lessonInfo}) : super(key: key);
  final LessonInfo lessonInfo;

  @override
  State<LearningDetailView> createState() => _LearningDetailViewState();
}

class _LearningDetailViewState extends State<LearningDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: staticAppbar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Kết quả học tập', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
        backgroundColor: const Color(0xff07527B),
      ),
      body: Padding(
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lớp học: ${widget.lessonInfo.lesson?.classData?.className ?? ''}',
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 0.5.h),
            Text(
              'Ngày: ${DateFormat.yMd().format(widget.lessonInfo.lesson?.sessionDate ?? DateTime.now())}',
              style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 0.5.h),
            Text(
              'Học viên: ${CacheData.student.name}',
              style: TextStyle(fontSize: 12.sp, color: Colors.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 1.h),
            Table(
              border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: <TableRow>[
                TableRow(
                  children: <Widget>[
                    SizedBox(
                      width: 30.w,
                      height: 4.h,
                      child: const Center(child: Text('Bài tập về nhà')),
                    ),
                    SizedBox(
                      width: 30.w,
                      height: 4.h,
                      child: Center(child: Text('${widget.lessonInfo.score}')),
                    ),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    SizedBox(
                      width: 30.w,
                      height: 4.h,
                      child: const Center(child: Text('Thái độ học tập')),
                    ),
                    SizedBox(
                      width: 30.w,
                      height: 4.h,
                      child: Center(
                        child: RatingBarIndicator(
                          rating: widget.lessonInfo.attitude!,
                          itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
                          itemSize: 30,
                          unratedColor: Colors.amber.withAlpha(50),
                        ),
                      ),
                    ),
                  ],
                ),
                TableRow(children: <Widget>[
                  SizedBox(
                    width: 30.w,
                    height: 4.h,
                    child: const Center(child: Text('Kết quả học tập')),
                  ),
                  SizedBox(
                    width: 30.w,
                    height: 4.h,
                    child: Center(
                      child: RatingBarIndicator(
                        rating: widget.lessonInfo.result!,
                        itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
                        itemSize: 30,
                        unratedColor: Colors.amber.withAlpha(50),
                      ),
                    ),
                  ),
                ])
              ],
            ),
            SizedBox(height: 1.h),
            if (widget.lessonInfo.review != null && widget.lessonInfo.result != '')
              Row(
                children: [
                  Text(
                    'Nhận xét: ',
                    style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(widget.lessonInfo.review ?? '')
                ],
              ),
          ],
        ),
      ),
    );
  }
}
