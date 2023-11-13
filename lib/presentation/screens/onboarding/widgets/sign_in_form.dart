import 'package:flutter/material.dart';
import 'package:syoftassignment/core/constants/regex_constants.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
  final GlobalKey formKey;

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !RegExp(RegexConstants.emailRegex).hasMatch(value.trim())) {
                return 'Invalid email';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: 'Email address',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              return (value == null || value.isEmpty || value.length < 8)
                  ? 'Invalid Password'
                  : null;
            },
            decoration: const InputDecoration(
              hintText: 'Password',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Icon(
                Icons.facebook_outlined,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                Icons.email_outlined,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
