
import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LearningPlanWidget extends StatelessWidget {
  const LearningPlanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
      decoration: BoxDecoration(
        color: AppColor.kwhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  value: 40 / 48,
                  strokeWidth: 4,
                  backgroundColor: AppColor.klightGrey2,
                  valueColor: AlwaysStoppedAnimation(AppColor.kdarkgrey),
                ),
              ),
              const Gap(14),
              const Text(
                'Packaging Design',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColor.ktxtprimary,
                    fontSize: 14),
              ),
              const Spacer(),
              RichText(
                text: const TextSpan(
                    text: '40',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.ktxtprimary),
                    children: [
                      TextSpan(
                          text: '/48',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.ktxtsecondary))
                    ]),
              ),
            ],
          ),
          const Gap(20),
          Row(
            children: [
              const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  value: 18 / 48,
                  strokeWidth: 4,
                  backgroundColor: AppColor.klightGrey2,
                  valueColor: AlwaysStoppedAnimation(AppColor.kdarkgrey),
                ),
              ),
              const Gap(14),
              const Text(
                'Product Design',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColor.ktxtprimary,
                    fontSize: 14),
              ),
              const Spacer(),
              RichText(
                text: const TextSpan(
                    text: '6',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColor.ktxtprimary),
                    children: [
                      TextSpan(
                          text: '/24',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColor.ktxtsecondary))
                    ],
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}