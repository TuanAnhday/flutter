import 'dart:collection';
import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/app/main/home/schedule/schedule.cubit.dart';
import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:ai_care/config/application.dart';
import 'package:ai_care/utils/event.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:table_calendar/table_calendar.dart';

class ScheduleView extends StatefulWidget {
  const ScheduleView({Key? key}) : super(key: key);

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}

class _ScheduleViewState extends State<ScheduleView> {
  final ScheduleCubit _cubit = ScheduleCubit();

  late List<DateTime> events = [];
  late LinkedHashMap<DateTime, List<Event>> _groupedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;

  LinkedHashMap<DateTime, List<Event>> _groupEvents(List<DateTime> events) {
    _groupedEvents = LinkedHashMap(equals: isSameDay, hashCode: getHashCode);
    for (final event in events) {
      final DateTime date = DateTime.utc(event.year, event.month, event.day, 12);
      if (_groupedEvents[date] == null) {
        _groupedEvents[date] = [];
      }
      _groupedEvents[date]?.add(const Event('event'));
    }
    return _groupedEvents;
  }

  List<dynamic> _getEventsForDay(DateTime date) {
    return _groupedEvents[date] ?? [];
  }

  @override
  void initState() {
    _cubit.getClassByStudentId(Application.sharePreference.getString('studentId')!);
    _groupEvents(events);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                backgroundColor: const Color(0xff07527B),
                expandedHeight: 15.h,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back_outlined),
                  onPressed: () => Modular.to.navigate(AppModule.main + NavBarModule.navbar),
                ),
                title: Text('Lịch học', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp)),
                flexibleSpace: FlexibleSpaceBar(
                  title: TextButton(
                    style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                    onPressed: _showDialog,
                    child: Text(
                      _cubit.classStudent.className ?? 'Chọn lớp',
                      style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  centerTitle: true,
                  background: Image.asset('assets/images/home/appbar/appbar.png', fit: BoxFit.cover),
                )),
          ];
        },
        body: Container(
          color: const Color(0xff07527B),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Color(0xffEAEAEA),
            ),
            child: Column(
              children: [
                TableCalendar(
                  eventLoader: _getEventsForDay,
                  calendarFormat: _calendarFormat,
                  firstDay: DateTime.utc(2022, 10, 20),
                  lastDay: DateTime.utc(2030, 10, 20),
                  focusedDay: _focusedDay,
                  headerStyle: const HeaderStyle(titleTextStyle: TextStyle(fontSize: 20, color: Colors.deepPurple, fontWeight: FontWeight.w800)),
                  calendarStyle: const CalendarStyle(todayTextStyle: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!isSameDay(_selectedDay, selectedDay)) {
                      final params = {'classId': _cubit.classStudent.id, 'date': selectedDay.toString()};
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                        if (_cubit.classStudent.id != null) {
                          _cubit.getActivitiesByClassAndDate(params);
                        }
                      });
                    }
                  },
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() => _calendarFormat = format);
                    }
                  },
                  onPageChanged: (focusedDay) => _focusedDay = focusedDay,
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     AdvancedCalendar(
                //       controller: _calendarControllerToday,
                //       events: events,
                //       startWeekDay: 1,
                //     ),
                //   ],
                // ),
                SizedBox(height: 1.h),
                Expanded(child: buildBody())
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: Tooltip(
      //   message: 'Xin nghỉ',
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       // Add your onPressed code here!
      //     },
      //     backgroundColor: Colors.green,
      //     child: const Icon(Icons.edit),
      //   ),
      // ),
    );
  }

  Widget buildBody() {
    return BlocBuilder<ScheduleCubit, ScheduleState>(
        bloc: _cubit,
        buildWhen: (pre, now) => now is ActivityLoading || now is ActivityLoaded,
        builder: (context, state) => state is ActivityLoaded && _cubit.activitiesInClass.isNotEmpty
            ? SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          if (_cubit.activitiesInClass.isNotEmpty) const Text('Thời gian'),
                          SizedBox(height: 1.h),
                          ...List.generate(
                            _cubit.activitiesInClass.length,
                            (index) => Container(
                              width: 20.w,
                              height: 10.h,
                              margin: EdgeInsets.only(bottom: 1.h),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Text(DateFormat.Hm().format(_cubit.activitiesInClass.elementAt(index).date ?? DateTime.now())),
                                  Text('${_cubit.activitiesInClass.elementAt(index).startTime}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  Text('${_cubit.activitiesInClass.elementAt(index).endTime}'),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: (11.h) * _cubit.activitiesInClass.length,
                        width: 1.w,
                        margin: EdgeInsets.symmetric(vertical: 2.h),
                        child: const VerticalDivider(color: Color(0XFF1B6086), thickness: 0.5),
                      ),
                      SizedBox(width: 2.w),
                      Column(
                        children: [
                          if (_cubit.activitiesInClass.isNotEmpty) const Text('Nội dung'),
                          SizedBox(height: 1.h),
                          ...List.generate(
                            _cubit.activitiesInClass.length,
                            (index2) => Container(
                              width: 70.w,
                              height: 10.h,
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                              margin: EdgeInsets.only(bottom: 1.h),
                              decoration: BoxDecoration(color: const Color(0XFFC5CFCB), borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '${_cubit.activitiesInClass.elementAt(index2).topic}',
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text('Nội dung: ${_cubit.activitiesInClass.elementAt(index2).content}'),
                                  Text('Lớp học: ${_cubit.classStudent.className}'),
                                  Expanded(
                                    child: Text(
                                      'Ghi chú: ${_cubit.activitiesInClass.elementAt(index2).note}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            : const Center(child: Text('Không có dữ liệu')));
  }

  void _showDialog() {
    _cubit.getClassByStudentId(Application.sharePreference.getString('studentId')!);
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Chọn lớp học'),
        content: BlocBuilder<ScheduleCubit, ScheduleState>(
          bloc: _cubit,
          buildWhen: (pre, now) => now is ClassLoaded || now is ClassLoading,
          builder: (context, state) => state is ClassLoaded
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      _cubit.classes.length,
                      (index) => TextButton(
                        onPressed: () {
                          _cubit.classStudent = _cubit.classes.elementAt(index);
                          final params = {
                            'classId': _cubit.classStudent.id,
                            'date': DateTime.now().toString(),
                          };
                          _cubit
                            ..getActivitiesByClassAndDate(params)
                            ..getActivitiesByClassId('${_cubit.classes.elementAt(index).id}').then((value) {
                              setState(() {
                                events = _cubit.activities.map((e) => e.date!).toList();
                                _groupEvents(events);
                              });
                            });
                          Navigator.pop(context, 'Cancel');
                        },
                        child: Text('${_cubit.classes.elementAt(index).className}'),
                      ),
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
