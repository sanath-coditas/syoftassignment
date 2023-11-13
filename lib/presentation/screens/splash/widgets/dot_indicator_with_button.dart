import 'package:flutter/material.dart';

class DotIndicatorWithButton extends StatelessWidget {
  const DotIndicatorWithButton({
    super.key,
    required this.text,
    required this.pageIndex,
    required this.onTap,
  });
  final String text;
  final int pageIndex;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          3,
          (index) => Container(
            height: 5,
            width: 5,
            margin: const EdgeInsets.symmetric(
              horizontal: 3,
            ),
            decoration: BoxDecoration(
              color: (index == pageIndex)
                  ? const Color.fromRGBO(20, 30, 85, 1)
                  : Colors.grey,
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(20, 30, 85, 1),
              borderRadius: BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
