import 'package:flutter/material.dart';
import 'package:syoftassignment/core/constants/regex_constants.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.reEnterPasswordController,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.cityController,
    required this.zipCodeController,
  });
  final GlobalKey formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController reEnterPasswordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final TextEditingController cityController;
  final TextEditingController zipCodeController;

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
          Column(
            children: [
              TextFormField(
                obscureText: true,
                controller: reEnterPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return 'Invalid Password';
                  }
                  if (value.isNotEmpty && value != passwordController.text) {
                    return 'Passwords donot Match!';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: 'Password again',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: firstNameController,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Invalid First Name'
                      : null;
                },
                decoration: const InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: lastNameController,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Invalid Last Name'
                      : null;
                },
                decoration: const InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: phoneController,
                maxLength: 10,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !RegExp(RegexConstants.phoneNumberRegex)
                          .hasMatch(value.trim())) {
                    return 'Invalid Phone Number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Phone',
                  counterText: '',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: cityController,
                validator: (value) {
                  return (value == null || value.isEmpty)
                      ? 'Invalid Last Name'
                      : null;
                },
                decoration: const InputDecoration(
                  hintText: 'City',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: zipCodeController,
                maxLength: 6,
                keyboardType: TextInputType.number,
                validator: (value) {
                  return (value == null ||
                          value.isEmpty ||
                          !RegExp(RegexConstants.digitsOnly).hasMatch(value) ||
                          value.length != 6)
                      ? 'Invalid Zip Code'
                      : null;
                },
                decoration: const InputDecoration(
                  hintText: 'Zip Code',
                  counterText: '',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
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
            height: 120,
          ),
        ],
      ),
    );
  }
}
