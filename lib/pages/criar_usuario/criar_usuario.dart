import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:froms/pages/login/login_cubit/login_bloc.dart';
import 'package:froms/widgets/helpers/media_query.dart';
import 'package:froms/widgets/login_button.dart';
import 'package:froms/widgets/login_form_field.dart';

class CriarUsuario extends StatefulWidget {
  CriarUsuario({super.key});

  @override
  State<CriarUsuario> createState() => _CriarUsuarioState();
}

class _CriarUsuarioState extends State<CriarUsuario> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _senha = TextEditingController();
  final TextEditingController _primeiroNome = TextEditingController();
  final TextEditingController _sobrenome = TextEditingController();
  final TextEditingController _idade = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final LoginBloc _loginBloc;
  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: height(context, 0.1),
              ),
              LoginFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                label: const Text("Email"),
                validator: (value) {
                  if (_email.text.isEmpty) {
                    return "Campo Não Preenchido";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height(context, 0.02),
              ),
              LoginFormField(
                controller: _primeiroNome,
                label: const Text("Nome"),
                validator: (value) {
                  if (_primeiroNome.text.isEmpty) {
                    return "Campo Não Preenchido";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height(context, 0.02),
              ),
              LoginFormField(
                controller: _sobrenome,
                label: const Text("Sobrenome"),
                validator: (value) {
                  if (_sobrenome.text.isEmpty) {
                    return "Campo Não Preenchido";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height(context, 0.02),
              ),
              LoginFormField(
                controller: _idade,
                label: const Text("Idade"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (_idade.text.isEmpty) {
                    return "Campo Não Preenchido";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height(context, 0.02),
              ),
              LoginFormField(
                controller: _senha,
                label: const Text("Senha"),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                validator: (value) {
                  if (_senha.text.isEmpty) {
                    return "Campo Não Preenchido";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: height(context, 0.03),
              ),
              LoginButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await _loginBloc.cadastro(_email.text, _primeiroNome.text,
                          _sobrenome.text, _idade.text, _senha.text);
                      Navigator.pop(context);
                    }
                  },
                  texto: "Cadastrar")
            ],
          ),
        ),
      ),
    );
  }
}
