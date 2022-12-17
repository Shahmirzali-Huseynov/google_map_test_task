import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final double? radiusAll;
  final Size? buttonFixedSize;
  final Color? buttonColor;
  final EdgeInsets? padding;
  final BorderSide? side;
  final BorderRadiusGeometry? borderRadius;
  const ButtonWidget({
    required this.child,
    required this.onPressed,
    this.buttonFixedSize,
    this.padding,
    this.side,
    Key? key,
    this.buttonColor,
    this.radiusAll,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.grey.shade300,
        backgroundColor: buttonColor,
        fixedSize: buttonFixedSize,
        minimumSize: const Size(0, 0),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radiusAll ?? 8)),
        ),
        side: side ?? BorderSide.none,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding,
      ),
      child: child,
    );
  }
}
