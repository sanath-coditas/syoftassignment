import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syoftassignment/core/constants/asset_constants.dart';
import 'package:syoftassignment/core/constants/text_style_constants.dart';
import 'package:syoftassignment/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:syoftassignment/presentation/screens/splash/widgets/dot_indicator_with_button.dart';

class QuickDelivery extends StatelessWidget {
  const QuickDelivery({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                  GestureDetector(
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
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Quick Delivery',
                style: TextStyleConstants.s30WBcBlack,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Order your favourite meals will be delivered immediately.',
                style: TextStyleConstants.s15WNcBlack40,
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
                child: Center(
                  child: SvgPicture.asset(
                    AssetConstants.deliverySvg,
                    height: double.infinity,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: DotIndicatorWithButton(
                  text: 'Start',
                  pageIndex: 2,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
