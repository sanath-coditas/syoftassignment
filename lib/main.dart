import 'package:flutter/material.dart';
import 'package:syoftassignment/core/constants/text_style_constants.dart';
import 'package:syoftassignment/presentation/screens/splash/order_food_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyleConstants.s15WNcBlack40,
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(),
          ),
          errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              const Size(double.infinity, 40),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromRGBO(136, 78, 214, 1),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const OrderFood(),
    );
  }
}
