import 'dart:developer';

import 'package:digitalsalt_assignment/model/user_mode.dart';
import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:digitalsalt_assignment/res/icons_asset/images.dart';
import 'package:digitalsalt_assignment/view/home/course_progress.dart';
import 'package:digitalsalt_assignment/view_model/controller/courses_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CourseViewModel courseVM = Get.put(CourseViewModel());
var userModel = UserModel();

  @override
  void initState() {
    super.initState();
    courseVM.getCourseListData();
  }


  @override
  Widget build(BuildContext context) {
    log("first Name :::=> ${userModel.firstName.toString()}");
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
                        // const LearningPlanWidget(),
                        const Gap(15),
                        _buildMeetupCard(),
                          const Gap(15),
                          
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
              child:  const LearnedTodayViewWIdget(),
            ),
          ],
        ),
      )),
    );
  }

    Widget _buildMeetupCard() {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.klightPinkColor,
      ),
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
          SvgPicture.asset(ImageAssets.meetingBanner),
        ],
      ),
    );
  }

}