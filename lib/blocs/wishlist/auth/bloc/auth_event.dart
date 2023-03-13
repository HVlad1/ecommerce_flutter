part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

@immutable
class AppEventLogOut extends AuthEvent {
  const AppEventLogOut();

  @override
  List<Object?> get props => throw UnimplementedError();
}

@immutable
class AppEventLogIn extends AuthEvent {
  final String email;
  final String password;
  const AppEventLogIn({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

@immutable
class AppEventRegister extends AuthEvent {
  final String email;
  final String password;
  const AppEventRegister({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

@immutable
class AppEventResetPassword extends AuthEvent {
  final String email;
  const AppEventResetPassword({
    required this.email,
  });

  @override
  List<Object?> get props => [email];  
}
