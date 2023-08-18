import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<RegstrLoginEvent>(_login);
  }
  void _login(RegstrLoginEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(firebase: Status.loading));
    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      emit(state.copyWith(firebase: Status.success));
    }on FirebaseAuthException catch(e){
      print('Error--->${e.code}');
      emit(state.copyWith(firebase: Status.error));
    }
  }
}
enum Status { initial, loading, success, error }

extension FireebaseStatusX on Status{
  bool get isInitial => this == Status.initial;

  bool get isLoading => this == Status.loading;

  bool get isSuccess => this == Status.success;

  bool get isError => this == Status.error;
}