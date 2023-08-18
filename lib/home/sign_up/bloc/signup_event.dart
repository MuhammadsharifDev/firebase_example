part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class RegstrSignUpEvent extends SignupEvent {
  final String email;
  final String password;

  RegstrSignUpEvent({required this.password, required this.email});
}
