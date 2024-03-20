import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AppBarBox extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final Widget? leftWidget;
  final Widget? rightWidget;

  const AppBarBox({
    super.key,
    required this.color,
    required this.text,
    required this.textColor,
    this.leftWidget,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SafeArea(
          left: false,
          right: false,
          bottom: false,
          child: SizedBox(
            height: 48,
            child: Row(
              children: [
                SizedBox(
                  height: 48,
                  width: 48,
                  child: leftWidget,
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, right: 10.0, bottom: 4.0),
                      child: AutoSizeText(
                        text,
                        maxLines: 1,
                        minFontSize: 16,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 1000,
                            fontVariations: const [FontVariation('wght', 500)]),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 48,
                  child: rightWidget,
                )
              ],
            ),
          )),
    );
  }
}
