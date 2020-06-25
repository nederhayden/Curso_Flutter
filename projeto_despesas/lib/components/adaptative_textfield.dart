import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final typePlatform = Platform.isIOS;

  final String label;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Function(String) onSubmitted;

  AdaptativeTextField({
    this.label,
    this.keyboardType = TextInputType.text,
    this.controller,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return typePlatform
        ? Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: CupertinoTextField(
              controller: controller,
              keyboardType: keyboardType,
              onSubmitted: onSubmitted,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
        )
        : TextField(
            controller: controller,
            onSubmitted: onSubmitted,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
