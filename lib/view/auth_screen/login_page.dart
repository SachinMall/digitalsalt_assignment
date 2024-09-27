import 'dart:developer';

import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:digitalsalt_assignment/utils/utils.dart';
import 'package:digitalsalt_assignment/view/auth_screen/signup_page.dart';
import 'package:digitalsalt_assignment/view/common_widgets/common_buttons.dart';
import 'package:digitalsalt_assignment/view/common_widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  final FocusNode _logInEmailFocusNode = FocusNode();
  final FocusNode _logInPasswordFocusNode = FocusNode();

  bool _obscureText = true;
  String email = '';
  String password = '';

  @override
  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _logInEmailFocusNode.dispose();
    _logInPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Log In",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColor.ktxtprimary),
              ),
              const Gap(40),
              CustomInputField(
                  textController: _loginEmailController,
                  focusNode: _logInEmailFocusNode,
                  onSubmit: (_) => Utils.fieldFocusChange(
                      context, _logInEmailFocusNode, _logInPasswordFocusNode),
                  onChanged: (p0) {},
                  textInputType: TextInputType.emailAddress,
                  title: 'Your  Email',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email required';
                    }
                    String pattern =
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                    RegExp regex = RegExp(pattern);
                    if (!regex.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  hintText: 'Enter your email'),
              const Gap(24),
              CustomInputField(
                  textController: _loginPasswordController,
                  focusNode: _logInPasswordFocusNode,
                  onChanged: (p0) {},
                  textInputType: TextInputType.visiblePassword,
                  obscureText: _obscureText,
                  title: 'Password',
                  isSuffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: AppColor.ktxtprimary,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                  hintText: 'Enter your password'),
              const Gap(12),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forget password?",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColor.ktxtsecondary),
                ),
              ),
              const Gap(12),
              PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Utils.snackBar('Success', 'Log In successfully');
                      log('Login account with email: ${_loginEmailController.text}');
                    }
                  },
                  title: 'Log In'),
              const Gap(26),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.ktxtsecondary),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const SignUpPage());
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          color: AppColor.kprimaryColor),
                    ),
                  ),
                ],
              ),
              const Gap(24),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 2,
                      width: Get.width,
                      color: AppColor.klightGrey,
                    ),
                  ),
                  const Gap(20),
                  const Text("Or login with",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColor.ktxtsecondary),),
                  const Gap(20),
                   Expanded(
                     child: Container(
                      height: 2,
                      width: Get.width,
                      color: AppColor.klightGrey,
                                       ),
                   ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}