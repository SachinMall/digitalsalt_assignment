import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class PrimaryButton extends StatelessWidget {
  final Function() onTap;
  final String title;
  final bool isActive;
  final bool? isCenter;
  final bool isImage;
  final Widget? isIcon;
  final String? imagePath;
  final Color? customTextColor;
  final Color? customContainerColor;
  final Color? customBorderColor;

  const PrimaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.isActive = true,
    this.isCenter = true,
    this.isImage = false,
    this.imagePath,
    this.customTextColor,
    this.customContainerColor,
    this.customBorderColor,
    this.isIcon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // borderRadius: BorderRadius.circular(4),
      onTap: isActive ? onTap : () {},
      child: Container(
        height: 50,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: customContainerColor ??
              (isActive ? AppColor.kprimaryColor : AppColor.kwhite),
          border: Border.all(color: customBorderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              isIcon ?? const SizedBox(),
           const Gap(5),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  // color: isActive == false ? kblack : AppColor.kwhite,
                  color: customTextColor ??
                      (isActive ? AppColor.kwhite : AppColor.kblack),
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
              isImage
                  ? SvgPicture.asset(imagePath!, fit: BoxFit.contain)
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final bool isActive;
  final Color? txtColor;

  const SecondaryButton({
    super.key,
    required this.onTap,
    required this.title,
    this.isActive = true,
    this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // borderRadius: BorderRadius.circular(4),
      onTap: isActive ? onTap : () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: isActive ? AppColor.kwhite : AppColor.kwhite,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.kprimaryColor)),
        child: Center(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,fontWeight: FontWeight.w500,
                color: txtColor ??
                    (isActive ? AppColor.kprimaryColor : Colors.red)),
          ),
        ),
      ),
    );
  }
}