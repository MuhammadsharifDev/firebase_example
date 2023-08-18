part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class RegstrLoginEvent extends LoginEvent {
  final String email;
  final String password;

  RegstrLoginEvent({required this.password, required this.email});
}
