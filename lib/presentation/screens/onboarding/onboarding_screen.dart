import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syoftassignment/core/constants/text_style_constants.dart';
import 'package:syoftassignment/presentation/screens/dashboard_screen.dart';
import 'package:syoftassignment/presentation/screens/onboarding/bloc/authentication/authentication_bloc.dart';
import 'package:syoftassignment/presentation/screens/onboarding/widgets/sign_in_form.dart';
import 'package:syoftassignment/presentation/screens/onboarding/widgets/sign_up_form.dart';
import 'package:syoftassignment/presentation/screens/onboarding/widgets/text_with_underline.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool isLogin = true;
  final TextEditingController signInEmailController = TextEditingController();
  final TextEditingController signInPasswordController =
      TextEditingController();

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController reEnterPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      create: (context) => AuthenticationBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        bottomNavigationBar: Builder(builder: (context) {
          return BottomAppBar(
            child: Stack(
              alignment: Alignment.centerRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 60,
                  color: Colors.grey.withOpacity(0.6),
                ),
                Positioned(
                  bottom: 35,
                  right: 20,
                  child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                    listener: (context, state) {
                      if (state is AuthenticationSuccessfulState) {
                        Navigator.popUntil(context, (route) => false);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DashboardScreen(
                              personEntity: state.personEntity,
                            ),
                          ),
                        );
                      }
                      if (state is FailureState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: (state is LoadingState)
                            ? null
                            : () {
                                if (isLogin) {
                                  if (signInFormKey.currentState?.validate() ??
                                      false) {
                                    context.read<AuthenticationBloc>().add(
                                          AuthenticateEvent(
                                            isSignIn: isLogin,
                                            email: signInEmailController.text,
                                            password:
                                                signInEmailController.text,
                                          ),
                                        );
                                  }
                                } else {
                                  if (signUpFormKey.currentState?.validate() ??
                                      false) {
                                    context.read<AuthenticationBloc>().add(
                                          AuthenticateEvent(
                                            isSignIn: isLogin,
                                            city: cityController.text,
                                            email: emailController.text,
                                            firstName: firstNameController.text,
                                            lastName: lastNameController.text,
                                            password: passwordController.text,
                                            phoneNumber: phoneController.text,
                                            zipcode: zipCodeController.text,
                                          ),
                                        );
                                  }
                                }
                              },
                        child: Container(
                          width: 80,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isLogin
                                ? const Color.fromRGBO(241, 200, 87, 1)
                                : const Color.fromRGBO(226, 91, 92, 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(11),
                            ),
                          ),
                          child: (state is LoadingState)
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                ),
                        ),
                      );
                    },
                  ),
                ),
                if (isLogin)
                  Positioned(
                    bottom: 65,
                    left: 20,
                    child: Text(
                      'Forgot password?',
                      style: TextStyleConstants.s15WBcBlack,
                    ),
                  ),
              ],
            ),
          );
        }),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = true;
                          });
                        },
                        child: TextWithUnderline(
                          isActive: isLogin,
                          text: 'Login',
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLogin = false;
                          });
                        },
                        child: TextWithUnderline(
                          isActive: !isLogin,
                          text: 'SignUp',
                        ),
                      ),
                      const Spacer(),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: isLogin
                              ? const Color.fromRGBO(241, 200, 87, 1)
                              : const Color.fromRGBO(226, 91, 92, 1),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(11),
                          ),
                        ),
                        child: IconButton(
                          constraints: const BoxConstraints(),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person_rounded,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  (isLogin)
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Welcome Back,\n',
                                  style: TextStyleConstants.s30WNcBlack,
                                ),
                                TextSpan(
                                  text: 'User',
                                  style: TextStyleConstants.s30WBcBlack,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Align(
                          alignment: Alignment.centerLeft,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hello ',
                                  style: TextStyleConstants.s30WNcBlack,
                                ),
                                TextSpan(
                                  text: 'Foodie,\n',
                                  style: TextStyleConstants.s30WBcBlack,
                                ),
                                const TextSpan(
                                  text: '\n',
                                  style: TextStyle(fontSize: 5),
                                ),
                                TextSpan(
                                  text:
                                      'Enter your information below or login with a social account',
                                  style: TextStyleConstants.s15WNcBlack40,
                                ),
                              ],
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 60,
                  ),
                  if (isLogin)
                    SignInForm(
                      emailController: signInEmailController,
                      passwordController: signInPasswordController,
                      formKey: signInFormKey,
                    )
                  else
                    SignUpForm(
                      formKey: signUpFormKey,
                      cityController: cityController,
                      emailController: emailController,
                      firstNameController: firstNameController,
                      lastNameController: lastNameController,
                      passwordController: passwordController,
                      phoneController: phoneController,
                      reEnterPasswordController: reEnterPasswordController,
                      zipCodeController: zipCodeController,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
