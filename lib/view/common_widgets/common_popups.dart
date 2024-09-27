import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:digitalsalt_assignment/view/common_widgets/common_buttons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SuccessPopup extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const SuccessPopup({
    super.key,
    required this.title,
    required this.message,
    required this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColor.kprimaryColor),
                child: const Center(
                  child: Icon(
                    Icons.check,size: 40,
                    color: AppColor.kwhite,
                  ),
                ),
              ),
              const Gap(20),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500,color: AppColor.ktxtprimary),
              ),
            const Gap(10),
              Text(
                message,
                style: 
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: AppColor.ktxtsecondary),
                textAlign: TextAlign.center,
              ),
             const Gap(15),
              PrimaryButton(onTap: onButtonPressed, title: buttonText)
            ],
          ),
        ));
  }
}
