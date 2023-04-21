import 'package:ai_care/models/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class WalletView extends StatefulWidget {
  const WalletView({required this.wallets, Key? key}) : super(key: key);
  final List<Wallet> wallets;

  @override
  State<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          widget.wallets.length,
          (index) => Container(
            width: 90.w,
            padding: const EdgeInsets.all(10),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(15.sp), color: Colors.white, border: Border.all(color: const Color(0xff1B6086))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nạp tiền vào ví', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xff1B6086))),
                    Text(
                      NumberFormat().format(widget.wallets.elementAt(index).totalAmount.round()),
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xff1B6086)),
                    ),
                  ],
                ),
                SizedBox(height: 1.h),
                Text(DateFormat.yMd().format(widget.wallets.elementAt(index).createdDate!))
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text('Nạp tiền ', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xff1B6086))),
                //     Text(
                //       NumberFormat().format(_cubit.wallets.elementAt(index).totalAmount.round()),
                //       style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: const Color(0xff1B6086)),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
