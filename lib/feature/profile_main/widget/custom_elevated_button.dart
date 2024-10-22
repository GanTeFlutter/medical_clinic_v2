import 'package:flutter/material.dart';

class CustomSimpleElevatedButton extends StatefulWidget {
  const CustomSimpleElevatedButton(
      {super.key, required this.isIcon, this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  final bool isIcon;

  @override
  State<CustomSimpleElevatedButton> createState() =>
      _CustomSimpleElevatedButtonState();
}

class _CustomSimpleElevatedButtonState
    extends State<CustomSimpleElevatedButton> {
  bool isIcon = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          side: WidgetStateProperty.all(
              const BorderSide(width: 2, color: Colors.grey)),
          overlayColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.2))),
      onPressed: widget.onPressed,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // İkon ve metni ortalar
          children: [
            Text(
              widget.text,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox(width: 10),
            widget.isIcon
                ? const Icon(
                    Icons.delete_forever_rounded,
                    color: Colors.black,
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
