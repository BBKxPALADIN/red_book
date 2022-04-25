import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:red_book/core/theme/app_colors.dart';
import 'package:red_book/core/theme/app_text_style.dart';

import 'always_disabled_focus_node.dart';

class CustomEmailTextField extends StatelessWidget {
  final String? labelText;
  final bool? showError;
  final TextEditingController? controller;
  final bool autoFocus;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? errorText;
  final TextInputAction? inputAction;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final String? hintText;
  final bool? obscureText;
  final BuildContext? context;
  final Function()? onTap, onComplete;
  final bool readOnly;
  final double radius;
  final double labelPadding;
  final String? suffixText;
  final Widget? suffixIcon, prefixIcon;
  final TextStyle? suffixStyle, labelStyle, textStyle;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor,
      focusedBorderColor,
      enabledBorderColor,
      errorBorderColor,
      focusedErrorBorderColor;
  final EdgeInsets? contentPadding;
  final InputBorder? focusedBorder,
      enabledBorder,
      errorBorder,
      focusedErrorBorder;
  final bool required;
  final FocusNode? focusNode;
  bool isDate=false;

  CustomEmailTextField({
    Key? key,
    this.labelText,
    this.showError,
    this.controller,
    this.autoFocus = false,
    this.onChanged,
    this.keyboardType,
    this.prefixText,
    this.errorText,
    this.inputAction,
    this.currentFocus,
    this.nextFocus,
    this.obscureText,
    this.hintText,
    this.context,
    this.onTap,
    this.readOnly = false,
    this.suffixText,
    this.suffixIcon,
    this.suffixStyle,
    this.prefixIcon,
    this.inputFormatters,
    this.fillColor,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.onComplete,
    this.required = false,
    this.focusNode,
    this.radius = 16,
    this.labelPadding = 12,
    this.labelStyle,
    this.textStyle,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.errorBorderColor,
    this.focusedErrorBorderColor,
    this.isDate=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null)
          Padding(
            padding: EdgeInsets.only(bottom: labelPadding),
            child: RichText(
              text: TextSpan(
                text: labelText ?? '',
                style: labelStyle ??
                    const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackSecondary,
                    ),
                children: required
                    ? [
                        const TextSpan(
                          text: ' *',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.red,
                          ),
                        ),
                      ]
                    : [],
              ),
            ),
          ),
        TextFormField(
          inputFormatters: inputFormatters,
          autocorrect: false,
          style: textStyle ??
              const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: AppColors.black,
              ),
          obscureText: obscureText ?? false,
          readOnly: readOnly,
          controller: controller,
          focusNode: isDate ? AlwaysDisabledFocusNode() : focusNode,
          onTap: onTap,
          autofocus: autoFocus,
          textCapitalization: TextCapitalization.none,
          onChanged: onChanged,
          onFieldSubmitted: (term) => _fieldFocusChange(
            context,
            focusNode,
            nextFocus,
          ),
          obscuringCharacter: '*',
          textInputAction: inputAction,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            suffixText: suffixText,
            suffixStyle: suffixStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: AppColors.black,
                ),
            suffixIcon: suffixIcon,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
            isDense: true,
            filled: true,
            prefixStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: AppColors.black,
            ),
            hintText: hintText,
            fillColor: fillColor ?? AppColors.textFieldColor,
            hintStyle:
                AppTextStyles.searchNotFound.copyWith(color: AppColors.grey),
            focusedBorder: focusedBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                      color: focusedBorderColor ?? AppColors.assets, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
            enabledBorder: enabledBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: enabledBorderColor ?? Colors.transparent,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
            errorBorder: errorBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorBorderColor ?? AppColors.red, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
            focusedErrorBorder: focusedErrorBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                      color: focusedBorderColor ?? AppColors.red, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(radius)),
                ),
            errorText: showError ?? false ? errorText : null,
          ),
          cursorColor: AppColors.assets,
          keyboardType: keyboardType,
          onEditingComplete: onComplete,
        ),
      ],
    );
  }

  _fieldFocusChange(
    BuildContext context,
    FocusNode? currentFocus,
    FocusNode? nextFocus,
  ) {
    if (currentFocus != null && nextFocus != null) {
      currentFocus.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }
  }
}
