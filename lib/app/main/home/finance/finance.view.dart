import 'package:ai_care/app/app.module.dart';
import 'package:ai_care/app/main/home/finance/finance.cubit.dart';
import 'package:ai_care/app/main/home/finance/tuition/tuition.view.dart';
import 'package:ai_care/app/main/home/finance/wallet-voucher/wallet-voucher.view.dart';
import 'package:ai_care/app/main/home/finance/wallet/wallet.view.dart';
import 'package:ai_care/app/main/nav-bar.module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class FinanceView extends StatefulWidget {
  const FinanceView({Key? key}) : super(key: key);

  @override
  State<FinanceView> createState() => _FinanceViewState();
}

class _FinanceViewState extends State<FinanceView> {
  final ScrollController _scrollController = ScrollController();
  final FinanceCubit _cubit = FinanceCubit();
  late int tabIndex = 0;

  @override
  void initState() {
    _scrollController.addListener(() => _cubit.scrollListener(_scrollController));
    _cubit.getWalletOfStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          NestedScrollView(
            controller: _scrollController,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: const Color(0xff07527B),
                  expandedHeight: 15.h,
                  pinned: true,
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back_outlined),
                    onPressed: () => Modular.to.navigate(AppModule.main + NavBarModule.navbar),
                  ),
                  title: const Text('Tài chính', style: TextStyle(fontWeight: FontWeight.w600)),
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background: Image.asset('assets/images/home/appbar/appbar.png', fit: BoxFit.cover),
                  ),
                ),
              ];
            },
            body: Container(
              color: const Color(0xffEAEAEA),
              child: _buildBody(context),
            ),
          ),
          BlocBuilder<FinanceCubit, FinanceState>(
            bloc: _cubit,
            buildWhen: (pre, now) => now is WalletLoading || now is WalletLoaded || now is OffsetChanged,
            builder: (context, state) {
              return state is WalletLoaded || state is OffsetChanged
                  ? AnimatedPositioned(
                      top: 12.h - _cubit.scrollOffset,
                      duration: const Duration(),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: SizedBox(
                        width: 80.w,
                        height: 10.h,
                        child: Card(
                          elevation: 4,
                          shadowColor: const Color(0x3315608F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: const BorderSide(color: Color(0xff1B6086)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Số dư ví', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: const Color(0xff1B6086))),
                              Text(
                                  '${NumberFormat().format(_cubit.wallets.map((e) => e.surplusAmount ?? 0).reduce((value, element) => value + element))} vnđ',
                                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold, color: const Color(0xff1B6086)))
                            ],
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(
          onPressed: () => setState(() => tabIndex = 0),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/home/icon/finance.svg', width: 30.sp),
              const Text('Ví tiền'),
            ],
          ),
        ),
        TextButton(
          onPressed: () => setState(() => tabIndex = 1),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/home/icon/finance.svg', width: 30.sp),
              const Text('Ví voucher'),
            ],
          ),
        ),
        TextButton(
          onPressed: () => setState(() => tabIndex = 2),
          child: Column(
            children: [
              SvgPicture.asset('assets/images/home/icon/finance.svg', width: 30.sp),
              const Text('Học phí'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // SizedBox(height: 5.h),
          // _buildTabBar(context),
          BlocBuilder<FinanceCubit, FinanceState>(
            bloc: _cubit,
            buildWhen: (pre, now) => now is WalletLoading || now is WalletLoaded,
            builder: (context, state) {
              if (state is WalletLoaded) {
                return Column(
                  children: [
                    const SizedBox(height: 20),
                    if (tabIndex == 0) WalletView(wallets: _cubit.wallets),
                    if (tabIndex == 1) const WalletVoucherView(),
                    if (tabIndex == 2) const TuitionView()
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
