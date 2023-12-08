import 'package:flutter/material.dart';
import 'package:froms/widgets/helpers/media_query.dart';

class LoginButton extends StatelessWidget {
  final void Function() onPressed;
  final String texto;
  const LoginButton({
    Key? key,
    required this.onPressed,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(
            width(context, 0.8),
            height(context, 0.06),
          ),
          backgroundColor: Colors.black),
      child: Text(
        texto,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
