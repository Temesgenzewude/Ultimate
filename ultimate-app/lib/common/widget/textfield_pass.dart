import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/styles.dart';
import 'animation_click.dart';

class TextFieldPassCpn extends StatelessWidget {
  const TextFieldPassCpn({
    required this.controller,
    required this.focusNode,
    this.labelText,
    this.showSuffixIcon = false,
    this.colorSuffixIcon,
    this.suffixIcon,
    this.showPrefixIcon = false,
    this.prefixIcon,
    this.hasMutilLine = false,
    this.maxLines = 1,
    this.minLines,
    this.functionPrefix,
    this.maxLength,
    this.readOnly = false,
    this.functionSuffer,
    this.enabled = true,
    this.hintText,
    this.labelStyle,
    this.autoFocus = false,
    this.filled = true,
    this.obscureText = true,
    this.fillColor,
    this.borderColor,
    this.onChanged,
    this.onEditingComplete,
    this.suffixWidget,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? labelText;
  final bool showPrefixIcon;
  final String? prefixIcon;
  final bool showSuffixIcon;
  final String? suffixIcon;
  final Widget? suffixWidget;
  final Color? colorSuffixIcon;
  final bool hasMutilLine;
  final bool readOnly;
  final bool enabled;
  final bool obscureText;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final Function()? functionPrefix;
  final Function()? functionSuffer;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final String? hintText;
  final TextStyle? labelStyle;
  final bool autoFocus;
  final bool filled;
  final Color? fillColor;
  final Color? borderColor;

  OutlineInputBorder createInputDecoration(BuildContext context) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: grey200));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: labelStyle ?? headline(color: grey1100),
          ),
        ],
        const SizedBox(height: 8),
        TextField(
            controller: controller,
            focusNode: focusNode,
            minLines: minLines,
            readOnly: readOnly,
            maxLength: maxLength,
            autofocus: autoFocus,
            onChanged: onChanged,
            obscureText: obscureText,
            onEditingComplete: onEditingComplete,
            keyboardType: TextInputType.visiblePassword,
            onSubmitted: (value) {
              focusNode.unfocus();
            },
            style: body(color: grey1100),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: body(color: grey500),
              fillColor: fillColor ?? grey200,
              filled: filled,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              prefixIcon: showPrefixIcon
                  ? AnimationClick(
                      function: functionPrefix ?? () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: prefixIcon != null
                            ? Image.asset(
                                prefixIcon!,
                                height: 24,
                                width: 24,
                                color: grey500,
                              )
                            : const SizedBox(),
                      ),
                    )
                  : const SizedBox(),
              prefixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              suffixIcon: showSuffixIcon
                  ? suffixWidget == null
                      ? AnimationClick(
                          function: functionSuffer ?? () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: suffixIcon != null
                                ? Image.asset(
                                    suffixIcon!,
                                    height: 24,
                                    width: 24,
                                    color: colorSuffixIcon ?? grey500,
                                  )
                                : const SizedBox(),
                          ),
                        )
                      : suffixWidget
                  : const SizedBox(),
              suffixIconConstraints: const BoxConstraints(
                minHeight: 16,
                minWidth: 16,
              ),
              focusedBorder: createInputDecoration(context),
              enabledBorder: createInputDecoration(context),
              errorBorder: createInputDecoration(context),
              enabled: enabled,
            )),
      ],
    );
  }
}
