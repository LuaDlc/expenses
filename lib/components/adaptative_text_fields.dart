// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextFields extends StatelessWidget {
  const AdaptativeTextFields({
    Key? key,
    this.label,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onSubmitted,
  }) : super(key: key);

  final String? label;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              onSubmitted:
                  onSubmitted, //(_)-> vazio pois onsubmit nao recebe parametro
              keyboardType: keyboardType,
              controller: controller,
              placeholder: label,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
            ),
          )
        : TextField(
            onSubmitted:
                onSubmitted, //(_)-> vazio pois onsubmit nao recebe parametro
            keyboardType: keyboardType,
            controller: controller,
            decoration: InputDecoration(labelText: label),
          );
  }
}
