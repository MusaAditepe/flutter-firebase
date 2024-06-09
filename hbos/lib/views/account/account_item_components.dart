import 'package:flutter/material.dart';

class AccountItem extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final Color iconColor;
  final Color shadowColor;
  final IconData? icon;
  final Widget endWidget;

  const AccountItem({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.iconColor,
    required this.shadowColor,
    this.icon,
    this.endWidget = const Icon(
      Icons.arrow_forward_ios_rounded,
      size: 15,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              icon != null
                  ? CircleAvatar(
                      radius: 22,
                      backgroundColor: shadowColor,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                          icon,
                          color: iconColor,
                          size: 20,
                        ),
                      ),
                    )
                  : const SizedBox(width: 5),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          endWidget
        ],
      ),
    );
  }
}
