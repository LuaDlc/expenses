// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButtons extends StatelessWidget {
  const AdaptativeButtons({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: () => onPressed,
            color: CupertinoColors.systemPurple,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(label),
          )
        : TextButton(
            onPressed: () => onPressed,
            style: TextButton.styleFrom(backgroundColor: Colors.purple),
            child: Text(label),
          );
  }
}
