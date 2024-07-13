// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:social_butterfly/core/constants/enums/asset_enums.dart';

abstract class CustomFormField extends TextFormField {
  CustomFormField({
    super.key,
    super.controller,
    this.label = "",
    this.hintText,
    this.icon,
    this.suffix,
    this.autofillHints,
    this.keyboardType,
    this.textInputAction,
    super.validator,
    super.obscureText,
    this.helper,
    this.expands = false,
    this.constraints,
  });

  final String label;
  final String? hintText;
  final Widget? icon;
  final Widget? suffix;
  final Widget? helper;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final bool expands;
  final BoxConstraints? constraints;

  @override
  AutovalidateMode get autovalidateMode => AutovalidateMode.onUserInteraction;

  @override
  FormFieldBuilder<String> get builder => (_) => TextFormField(
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          icon: icon,
          suffix: suffix,
          constraints: constraints,
          alignLabelWithHint: true,
        ),
        autofillHints: autofillHints,
        autovalidateMode: autovalidateMode,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        textInputAction: textInputAction,
        expands: expands,
        minLines: expands ? null : 1,
        maxLines: expands ? null : 1,
        textAlignVertical: TextAlignVertical.top,
      );
}

class EmailField extends CustomFormField {
  EmailField({
    super.key,
    super.controller,
    super.label,
    super.hintText,
    super.keyboardType = TextInputType.emailAddress,
    super.textInputAction = TextInputAction.next,
    super.validator,
  });
  @override
  String get label => "Email";
  @override
  String? get hintText => "Enter your email";
  @override
  TextInputType? get keyboardType => TextInputType.emailAddress;
  @override
  Iterable<String>? get autofillHints => [AutofillHints.email];
}

class PasswordField extends CustomFormField {
  PasswordField({
    super.key,
    super.controller,
    super.label,
    super.hintText,
    super.keyboardType = TextInputType.emailAddress,
    super.textInputAction = TextInputAction.next,
    super.validator,
    super.helper,
  });

  @override
  String get label => "Password";
  @override
  String? get hintText => "Enter your password";
  @override
  TextInputType? get keyboardType => TextInputType.visiblePassword;

  bool _obscureText = true;

  @override
  FormFieldBuilder<String> get builder => (_) => StatefulBuilder(
        builder: (context, setState) => TextFormField(
          decoration: InputDecoration(
            label: Text(label),
            helper: helper,
            hintText: hintText,
            icon: icon,
            suffix: GestureDetector(
              child: Image.asset(
                _obscureText
                    ? AssetsEnum.locked.path
                    : AssetsEnum.openLock.path,
                filterQuality: FilterQuality.high,
              ),
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
          ),
          autofillHints: autofillHints,
          autovalidateMode: autovalidateMode,
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          textInputAction: textInputAction,
          obscureText: _obscureText,
        ),
      );
}

class NormalTextFormField extends CustomFormField {
  NormalTextFormField({
    super.key,
    super.controller,
    super.label,
    super.hintText,
    super.keyboardType = TextInputType.emailAddress,
    super.textInputAction = TextInputAction.next,
    super.validator,
  });

  @override
  String get label => "Header";
  @override
  TextInputType? get keyboardType => TextInputType.text;
}

class NormalTextAreaFormField extends CustomFormField {
  NormalTextAreaFormField({
    super.key,
    super.controller,
    super.label,
    super.hintText,
    super.textInputAction = TextInputAction.next,
    super.validator,
    super.constraints,
  });
  @override
  bool get expands => true;
  @override
  String get label => "Content";
  @override
  TextInputType? get keyboardType => TextInputType.multiline;
  @override
  // TODO: implement textInputAction
  TextInputAction? get textInputAction => TextInputAction.newline;
}
