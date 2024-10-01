
import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LearnedTodayViewWIdget extends StatelessWidget {
  const LearnedTodayViewWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.kwhite,
        borderRadius: BorderRadius.circular(16),
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
          const Row(
            children: [
              Text(
                "Learned today",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.ktxtsecondary,
                ),
              ),
              Spacer(),
              Text(
                "My courses",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColor.kprimaryColor,
                ),
              ),
            ],
          ),
          const Gap(2),
          const Row(
            children: [
              Text(
                "46min",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColor.ktxtprimary,
                ),
              ),
              Text(
                " / 60min",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColor.ktxtsecondary,
                ),
              ),
            ],
          ),
          const Gap(4),
          SizedBox(
            height: 6,
            child: LinearProgressIndicator(
              value: 46 / 60,
              borderRadius: BorderRadius.circular(10),
              backgroundColor: AppColor.klightGrey2,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColor.kprimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}