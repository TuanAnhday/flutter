part of 'opening-page.cubit.dart';

@immutable
abstract class OpeningPageState extends Equatable {
  const OpeningPageState();
}

class OpeningPageInitial extends OpeningPageState {
  const OpeningPageInitial();

  @override
  List<Object> get props => [];
}

class OpeningPageLoading extends OpeningPageState {
  const OpeningPageLoading();

  @override
  List<Object> get props => [];
}

class Signing extends OpeningPageState {
  const Signing();

  @override
  List<Object> get props => [];
}

class Signed extends OpeningPageState {
  const Signed();

  @override
  List<Object> get props => [];
}

class OpeningPageError extends OpeningPageState {

  const OpeningPageError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
