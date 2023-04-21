part of 'home.cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object> get props => [];
}
class OffsetChanged extends HomeState {

  const OffsetChanged(this.offset);
  final double offset;

  @override
  List<Object> get props => [offset];
}