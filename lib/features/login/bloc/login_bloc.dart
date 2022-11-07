import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonOnpress>((event, emit) async {
      emit(LoginLoading());
      if (event.userName == 'user' && event.password == 'user') {
        emit(LoginSuccess());
      } else {
        emit(const LoginFailed(message: 'Invalid credential!'));
      }
    });
  }
}
