import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lessonfirebase/home/with_google/bloc/regstr_bloc.dart';

class RegstrPage extends StatelessWidget {
  const RegstrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegstrBloc, RegstrState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: () {
                  context.read<RegstrBloc>().add(RegstrWithGoogleEvent());
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.7)),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        bottom: 10,
                        top: 10,
                        left: 30,
                        right: 30),
                    child: Text(
                      'Sign In with Google',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
        );
      },
    );
  }
}
