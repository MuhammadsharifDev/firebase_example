part of 'signup_bloc.dart';

@immutable
class SignupState extends Equatable {
  final Status firebase;

  const SignupState({this.firebase = Status.initial});

  SignupState copyWith({Status? firebase}){
    return SignupState(firebase: firebase??this.firebase);
  }
  @override
  List<Object?> get props => [firebase];
}
