part of 'login.cubit.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  const LoginInitial();

  @override
  List<Object> get props => [];
}

class LoginLoading extends LoginState {
  const LoginLoading();

  @override
  List<Object> get props => [];
}

class Signing extends LoginState {
  const Signing();

  @override
  List<Object> get props => [];
}

class Signed extends LoginState {
  const Signed();

  @override
  List<Object> get props => [];
}

class LoginError extends LoginState {

  const LoginError(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}
