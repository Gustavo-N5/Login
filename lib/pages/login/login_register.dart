import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:froms/pages/home/home.dart';
import 'package:froms/pages/login/login.dart';
import 'package:froms/pages/login/login_cubit/login_bloc.dart';

class LoginRegister extends StatefulWidget {
  LoginRegister({super.key});

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  late final LoginBloc loginBloc;
  @override
  void initState() {
    super.initState();
    loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LogedState || state is Registed) {
          return const Home();
        } else {
          return const Login();
        }
      },
    );
  }
}
