import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syoftassignment/core/constants/asset_constants.dart';
import 'package:syoftassignment/core/constants/text_style_constants.dart';
import 'package:syoftassignment/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:syoftassignment/presentation/screens/splash/cook_safe_food_screen.dart';
import 'package:syoftassignment/presentation/screens/splash/widgets/dot_indicator_with_button.dart';

class OrderFood extends StatelessWidget {
  const OrderFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 21,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).popUntil(
                      (route) => false,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyleConstants.s15WNcBlack40,
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Order Your Food',
                style: TextStyleConstants.s30WBcBlack,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Now you can order food anytime right from your mobile.',
                style: TextStyleConstants.s15WNcBlack40,
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Center(
                  child: SvgPicture.asset(
                    AssetConstants.orderSvg,
                    height: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: DotIndicatorWithButton(
                  text: 'Next',
                  pageIndex: 0,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CookSafeFood(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
