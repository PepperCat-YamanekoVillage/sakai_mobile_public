import 'package:flutter/material.dart';

class AnimatedHeartIcon extends StatefulWidget {
  final bool initState;
  final Color color;
  final Color borderColor;
  final Function()? onFavorite;
  final Function()? onUnfavorite;
  const AnimatedHeartIcon({
    super.key,
    required this.initState,
    this.color = const Color.fromARGB(255, 219, 50, 93),
    this.borderColor = const Color.fromARGB(255, 104, 104, 104),
    this.onFavorite,
    this.onUnfavorite,
  });

  @override
  createState() => _AnimatedHeartIconState();
}

class _AnimatedHeartIconState extends State<AnimatedHeartIcon> {
  bool isTappedEvenTimes = false;
  double? scaleValue;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () {
          isTappedEvenTimes = (!isTappedEvenTimes);
          setState(() {
            scaleValue = (getIsFavorite() ? 1 : 0);
          });
          if (getIsFavorite() && widget.onFavorite != null) {
            widget.onFavorite!();
          }
          if (!(getIsFavorite()) && widget.onUnfavorite != null) {
            widget.onUnfavorite!();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                color: widget.borderColor,
                size: 100,
              ),
              AnimatedScale(
                scale: scaleValue ?? (getIsFavorite() ? 1 : 0),
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                child: Icon(
                  Icons.favorite,
                  color: widget.color,
                  size: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool getIsFavorite() {
    if (widget.initState && isTappedEvenTimes) {
      return false;
    }
    if (widget.initState && (!isTappedEvenTimes)) {
      return true;
    }
    if ((!widget.initState) && isTappedEvenTimes) {
      return true;
    }
    if ((!widget.initState) && (!isTappedEvenTimes)) {
      return false;
    }

    return true;
  }
}
