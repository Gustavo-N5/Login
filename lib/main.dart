import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:froms/pages/criar_usuario/criar_usuario.dart';
import 'package:froms/pages/home/home.dart';
import 'package:froms/pages/login/login_cubit/login_bloc.dart';
import 'package:froms/pages/login/login_register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => LoginRegister(),
            "/cadastro": (context) => CriarUsuario(),
            "/home": (context) => const Home(),
          }),
    );
  }
}
