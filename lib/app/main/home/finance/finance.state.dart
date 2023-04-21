part of './finance.cubit.dart';

@immutable
abstract class FinanceState extends Equatable {
  const FinanceState();
}

class FinanceInitial extends FinanceState {
  const FinanceInitial();

  @override
  List<Object> get props => [];
}

class OffsetChanged extends FinanceState {
  const OffsetChanged(this.offset);

  final double offset;

  @override
  List<Object> get props => [offset];
}

class WalletLoading extends FinanceState {
  const WalletLoading();

  @override
  List<Object> get props => [];
}

class WalletLoaded extends FinanceState {

  const WalletLoaded({required this.wallets});
  final List<Wallet> wallets;

  @override
  List<Object> get props => [wallets.length];
}
