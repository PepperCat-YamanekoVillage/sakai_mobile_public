import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';
import 'package:auto_size_text/auto_size_text.dart';

class GradientButton extends StatelessWidget {
  final double height;
  final double width;
  final Color color1;
  final Color color2;
  final String text;
  final Function()? onTap;

  const GradientButton(
      {super.key,
      required this.height,
      required this.width,
      required this.color1,
      required this.color2,
      required this.text,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: OutlineGradientButton(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: const Alignment(-1, -1),
          end: const Alignment(2, 2),
        ),
        strokeWidth: height / 9,
        radius: const Radius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(left: height / 10, right: height / 10),
          child: Center(
            child: AutoSizeText(
              text,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 1000,
                fontVariations: [FontVariation('wght', 600)],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
