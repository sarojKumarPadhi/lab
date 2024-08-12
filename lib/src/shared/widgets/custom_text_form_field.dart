import 'package:flutter/services.dart';

import '../../../core/app_exports.dart';
import '../theme/app_style.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextInputType keyboardType;
  // final bool obscureText;
  final bool isPassword;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? prefix;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? borderRadius;
  final double borderWidth;
  final Color? enabledBorderColor;
  final Color? disableBorderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLine;
  final int? minLine;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final RxBool isvisible = false.obs;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  CustomTextFormField(
      {super.key,
      this.hintText,
      this.labelText,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.enabledBorderColor,
      this.disableBorderColor,
      this.focusBorderColor,
      this.errorBorderColor,
      this.textStyle,
      // this.obscureText = false,
      this.borderWidth = 1.0,
      this.floatingLabelBehavior,
      this.controller,
      this.contentPadding,
      this.borderRadius,
      this.prefixIcon,
      this.suffixIcon,
      this.fillColor,
      this.inputFormatters,
      this.onTap,
      this.onChanged,
      this.maxLength,
      this.maxLine,
      this.textCapitalization = TextCapitalization.none,
      this.minLine,
      this.textInputAction,
      this.onEditingComplete,
      this.suffixIconConstraints,
      this.prefixIconConstraints,
      this.validator,
      this.prefix,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    isvisible.value = isPassword;
    return Obx(() => TextFormField(
          validator: validator,
          keyboardType: keyboardType,
          obscureText: isvisible.value,
          style: textStyle,
          // ?? AppStyle.roboto14w500,
          controller: controller,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          minLines: maxLine,
          maxLines: maxLine ?? 1,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          readOnly: readOnly,
          textInputAction: textInputAction ?? TextInputAction.done,
          textCapitalization: textCapitalization,
          decoration: InputDecoration(
            prefix: prefix,
            fillColor: fillColor,
            filled: fillColor != null ? true : false,
            contentPadding: contentPadding,
            // ??
            //     const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            hintText: hintText,
            hintStyle: textStyle,
            //  ?? AppStyle.roboto14w500,
            labelText: labelText,
            labelStyle: textStyle,
            //  ?? AppStyle.roboto14w500,
            enabledBorder: enabledBorderColor == null
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        width: borderWidth, color: enabledBorderColor!),
                    borderRadius: borderRadius ?? BorderRadius.circular(10),
                  ),
            focusedBorder: focusBorderColor == null
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        width: borderWidth, color: focusBorderColor!),
                    borderRadius: borderRadius ?? BorderRadius.circular(10),
                  ),
            disabledBorder: enabledBorderColor == null
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        width: borderWidth, color: disableBorderColor!),
                    borderRadius: borderRadius ?? BorderRadius.circular(10),
                  ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: borderWidth,
                  color: Theme.of(context).colorScheme.outline),
              borderRadius: borderRadius ?? BorderRadius.circular(10),
            ),
            errorBorder: errorBorderColor == null
                ? null
                : OutlineInputBorder(
                    borderSide: BorderSide(
                        width: borderWidth, color: errorBorderColor!),
                    borderRadius: borderRadius ?? BorderRadius.circular(10),
                  ),
            floatingLabelBehavior:
                floatingLabelBehavior ?? FloatingLabelBehavior.auto,
            prefixIcon: prefixIcon,
            suffixIconConstraints: suffixIconConstraints,
            prefixIconConstraints: prefixIconConstraints,
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      isvisible.value = !isvisible.value;
                    },
                    icon: isvisible.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility))
                : suffixIcon,
          ),
        ));
  }
}
