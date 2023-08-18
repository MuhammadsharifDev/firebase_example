import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

part 'regstr_event.dart';
part 'regstr_state.dart';

class RegstrBloc extends Bloc<RegstrEvent, RegstrState> {
  RegstrBloc() : super(RegstrInitial()) {
    on<RegstrWithGoogleEvent>(_regstrWithGoogle);
  }
 Future<void> _regstrWithGoogle(RegstrWithGoogleEvent event,Emitter<RegstrState>emit)async{
    final _googleSign = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final GoogleSignInAccount? googleUser = await _googleSign.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      print(userCredential.user);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.message);
      return null;
    } catch (e, s) {
      debugPrint('$e, $s');
      return null;
    }
  }
}
