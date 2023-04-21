import 'dart:math' as math;

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

part 'home.state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());
  double scrollOffset = 0;

  void scrollListener(ScrollController scrollController) {
    scrollOffset = math.min(scrollController.offset, 20.h);
    emit(OffsetChanged(scrollOffset));
  }
}
