import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  const ClearButton({Key? key, required this.onPress}) : super(key: key);
  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPress, icon: const Icon(Icons.cancel));
  }
}
