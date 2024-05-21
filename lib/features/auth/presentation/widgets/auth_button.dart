import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final String? svgIconPath;
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.svgIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: svgIconPath != null
            ? Theme.of(context).focusColor
            : Theme.of(context).primaryColor ,
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          fixedSize: const Size(395, 55),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child:  svgIconPath != null ? Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(buttonText, style: Theme.of(context).textTheme.bodyLarge),

            SvgPicture.asset(svgIconPath!, width: 40,)
          ],
        ) : Text(buttonText, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
