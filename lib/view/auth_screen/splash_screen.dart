import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:digitalsalt_assignment/res/icons_asset/images.dart';
import 'package:digitalsalt_assignment/view/auth_screen/login_page.dart';
import 'package:digitalsalt_assignment/view/auth_screen/signup_page.dart';
import 'package:digitalsalt_assignment/view/common_widgets/common_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Spacer(),
            SvgPicture.asset(IconAssets.splashScreenIcon,
                fit: BoxFit.contain),
            const Gap(38),
            const Text(
              "Create your own\nstudy plan",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColor.ktxtprimary),
            ),
            const Gap(18),
            const Text(
              'Study according to the\nstudy plan, make study\nmore motivated',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: AppColor.ktxtsecondary),
            ),
            SizedBox(height: Get.height * .15),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(onTap: () {
                    Get.to(()=> const SignUpPage());
                  }, title: 'Sign up'),
                ),
                const Gap(16),
                Expanded(
                    child: SecondaryButton(onTap: () {
                        Get.to(()=> const LogInPage());
                    }, title: 'Log in'))
              ],
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
