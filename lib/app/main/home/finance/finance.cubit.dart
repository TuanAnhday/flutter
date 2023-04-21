import 'dart:math' as math;

import 'package:ai_care/config/application.dart';
import 'package:ai_care/services/wallet/wallet.service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../models/wallet/wallet.dart';

part 'finance.state.dart';

class FinanceCubit extends Cubit<FinanceState> {
  FinanceCubit() : super(const FinanceInitial());
  double scrollOffset = 0;
  List<Wallet> wallets = <Wallet>[];
  final WalletService _walletService = WalletService();

  void scrollListener(ScrollController scrollController) {
    scrollOffset = math.min(scrollController.offset, 5.h);
    emit(OffsetChanged(scrollOffset));
  }

  Future<void> getWalletOfStudent() async {
    emit(const WalletLoading());
    final data = await _walletService.getWalletOfStudent(Application.sharePreference.getString('studentId')!);
    wallets = data;
    emit(WalletLoaded(wallets: wallets));
  }

}
