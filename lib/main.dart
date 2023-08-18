import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessonfirebase/home/login/bloc/login_bloc.dart';

import 'package:lessonfirebase/home/sign_up/bloc/signup_bloc.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:lessonfirebase/home/with_google/bloc/regstr_bloc.dart';
import 'package:lessonfirebase/home/with_google/regstr_with_google_page.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => SignupBloc(),),
      BlocProvider(create: (_)=>LoginBloc()),
      BlocProvider(create: (_)=>RegstrBloc()),

    ], child: const MaterialApp(
      home: RegstrPage(),
    ));
  }
}

