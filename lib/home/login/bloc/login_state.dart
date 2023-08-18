part of 'login_bloc.dart';

@immutable


class LoginState extends Equatable {
  final Status firebase;

  const LoginState({this.firebase = Status.initial});

  LoginState copyWith({Status? firebase}){
    return LoginState(firebase: firebase??this.firebase);
  }
  @override
  List<Object?> get props => [firebase];
}
