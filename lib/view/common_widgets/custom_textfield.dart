import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomInputField extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? initialValue;
  final Function(String) onChanged;
  final FocusNode? focusNode;
  final Function(String)? onSubmit;
  final VoidCallback? onSaved;
  final TextInputType textInputType;
  final bool readOnly;
  final bool isEnabled;
  final String hintText;
  final String? Function(String?) validator;
  final TextEditingController? textController;
  final bool obscureText;
  final bool isViewButtonRequired;
  final int? maxLength;
  final int maxLines;
  final bool isCounttextRequired;
  final bool isAutoValidteRequired;
  final Widget? isSuffixIcon;
  final String? suffixText;
  final Color fillColor;
  final void Function()? onTap;
  final TextStyle? hintstyle;
  final Widget? prefixIcon;
  final bool isEditIcon;
  final void Function()? onEditTap;
  final List<TextInputFormatter>? inputFormatter;

  const CustomInputField({
    super.key,
    required this.onChanged,
    this.onSubmit,
    this.onSaved,
    this.initialValue,
    required this.title,
    required this.textInputType,
    this.readOnly = false,
    this.isEnabled = true,
    this.hintText = '',
    required this.validator,
    this.textController,
    this.obscureText = false,
    this.isViewButtonRequired = false,
    this.maxLength,
    this.maxLines = 1,
    this.subtitle = "",
    this.isCounttextRequired = false,
    this.isAutoValidteRequired = false,
    this.isSuffixIcon,
    this.suffixText,
    this.prefixIcon,
    this.onTap,
    this.fillColor = AppColor.kwhite,
    this.hintstyle,
    this.isEditIcon = false,
    this.onEditTap,
    this.inputFormatter,this.focusNode,
  });

  // late TextEditingController _controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == ""
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: AppColor.ktxtsecondary),),
                  isEditIcon
                      ? GestureDetector(
                          onTap: onEditTap,
                          child: SvgPicture.asset(''))
                      : const SizedBox(),
                ],
              ),
        subtitle == ""
            ? const SizedBox()
            : Text(subtitle),
        const Gap(6),
        TextFormField(
          scrollPhysics: const NeverScrollableScrollPhysics(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          focusNode: focusNode,
          initialValue: initialValue,
          maxLines: maxLines,
          maxLength: maxLength,
          controller: textController,
          obscureText: obscureText,
          inputFormatters: inputFormatter,
          keyboardType: textInputType,
          readOnly: readOnly,
          onTap: onTap,
          onFieldSubmitted: onSubmit,
          onChanged: (newvalue) {
            onChanged(newvalue);
            if (isAutoValidteRequired) {
              if (newvalue != "") {
                Form.of(context).validate();
              }
            }
          },
          validator: validator,
          style: const TextStyle(color: AppColor.ktxtprimary,fontWeight: FontWeight.w400,fontSize: 14),
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            counterText: isCounttextRequired ? null : "",
            fillColor: fillColor,
            filled: true,
            errorMaxLines: 1,
            errorBorder: OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.redAccent.withOpacity(.6)),
              borderRadius: BorderRadius.circular(12),
            ),
            suffixIcon: isSuffixIcon,
            hintText: hintText,
            hintStyle:   TextStyle(color: AppColor.ktxtsecondary.withOpacity(.5),fontWeight: FontWeight.w400,fontSize: 12),
            border: OutlineInputBorder(
              borderSide:  const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:  const BorderSide(
                color: AppColor.klightGrey,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: const EdgeInsets.all(12),
            enabledBorder: OutlineInputBorder(
              borderSide:  const BorderSide(
                color: AppColor.klightGrey,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            errorStyle:
                 TextStyle(fontSize: 12, color: Colors.redAccent.withOpacity(.6), height: 0.5),
          ),
        ),
      ],
    );
  }
}