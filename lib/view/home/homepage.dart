import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:digitalsalt_assignment/res/icons_asset/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: Get.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: Get.height * .2,
                    width: Get.width,
                    padding: const EdgeInsets.all(16),
                    color: AppColor.kprimaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(10),
                        Row(
                          children: [
                            const Text(
                              'Hi, Kristin',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: AppColor.kwhite),
                            ),
                            const Spacer(),
                            SvgPicture.asset(ImageAssets.profileAvatar),
                          ],
                        ),
                        const Gap(2),
                        const Text(
                          'Let’s start learning',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColor.kwhite),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * .1),
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.klightBlueColor),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: SvgPicture.asset(
                                      ImageAssets.carsouleImage1,
                                      fit: BoxFit.contain,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'What do youwant to learn\ntoday ?',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.ktxtprimary),
                                  ),
                                  const Gap(40),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
                                    decoration: BoxDecoration(
                                      color: AppColor.korangeColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Get Started',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: AppColor.kwhite),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Learning Plan',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppColor.ktxtprimary),
                          ),
                        ),
                        const LearningPlanWidget(),
                        const Gap(15),
                        Container(
                          width: Get.width,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.klightPinkColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Meetup',
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.kdarkBlueColor),
                                  ),
                                  Gap(5),
                                  Text(
                                    'Off-line exchange of learning\nexperiences',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.kdarkBlueColor),
                                  ),
                                ],
                              ),
                              SvgPicture.asset(ImageAssets.meetingBanner)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: Get.height * .15,
              left: 16,
              right: 16,
              child: const LearnedTodayViewWIdget(),
            ),
          ],
        ),
      )),
    );
  }
}

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
