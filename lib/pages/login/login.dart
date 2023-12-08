import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:froms/pages/login/login_cubit/login_bloc.dart';
import 'package:froms/widgets/helpers/media_query.dart';
import 'package:froms/widgets/login_button.dart';
import 'package:froms/widgets/login_form_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();

  final _senhaController = TextEditingController();

  final _obscureSenha = true;

  late final LoginBloc _loginBloc;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginFormField(
              controller: _emailController,
              label: const Text("Email"),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (_emailController.text.isEmpty) {
                  return "Campo Não Preenchido";
                }
                return null;
              },
            ),
            SizedBox(
              height: height(context, 0.02),
            ),
            LoginFormField(
              controller: _senhaController,
              obscureText: _obscureSenha,
              label: const Text("Senha"),
              validator: (value) {
                if (_senhaController.text.isEmpty) {
                  return "Campo Não Preenchido";
                }
                return null;
              },
            ),
            SizedBox(
              height: height(context, 0.02),
            ),
            LoginButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _loginBloc.login(
                        _emailController.text, _senhaController.text);
                  }
                },
                texto: "Entrar"),
            SizedBox(
              height: height(context, 0.05),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Ainda não possui cadastro?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/cadastro", (route) => true);
                  },
                  child: const Text(
                    "Cadastre-se",
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
