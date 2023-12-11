import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:froms/pages/login/login_cubit/login_bloc.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LogedState) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                      "Seja Bem VIndo ${state.user.firstname} ${state.user.lastname}!!!"),
                ),
                TextButton(
                  onPressed: () {
                    _loginBloc.logout();
                  },
                  child: const Text(
                    "Sair",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        }
        if (state is Registed) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                      "Seja Bem VIndo ${state.user.firstname} ${state.user.lastname}!!!"),
                ),
                TextButton(
                  onPressed: () {
                    _loginBloc.logout();
                  },
                  child: const Text(
                    "Sair",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
