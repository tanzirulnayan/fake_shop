part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoginButtonOnpress extends LoginEvent {
  const LoginButtonOnpress({
    required this.userName,
    required this.password,
  });

  final String userName;
  final String password;
  @override
  List<Object> get props => [userName, password];
}
