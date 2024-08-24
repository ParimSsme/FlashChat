import 'package:flutter/material.dart';
import '../../../../constants.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  const RoundedButton(
      {Key? key,
      required this.title,
      required this.color,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: const TextStyle(color: kWhiteColor),
          ),
        ),
      ),
    );
  }
}
