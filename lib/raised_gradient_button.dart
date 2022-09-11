import 'package:flutter/material.dart';
import 'color_utils.dart';

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key? key,
    required this.child,
    this.width = double.infinity,
    this.height = 40.0,
    required this.onPressed, required RoundedRectangleBorder shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Gradient gradient = const LinearGradient(
        colors: [ColorUtils.themeGradientStart, ColorUtils.themeGradientEnd]);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40.0)),
          gradient: gradient,
          boxShadow: const [
            BoxShadow(
              // color: Colors.grey[500],
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(40.0)),
            onTap: onPressed(),
            child: Center(
              child: child,
            )),
      ),
    );
  }
}