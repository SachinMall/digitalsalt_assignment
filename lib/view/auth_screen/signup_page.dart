import 'dart:developer';

import 'package:digitalsalt_assignment/res/app_colors/colors.dart';
import 'package:digitalsalt_assignment/utils/utils.dart';
import 'package:digitalsalt_assignment/view/auth_screen/login_page.dart';
import 'package:digitalsalt_assignment/view/common_widgets/common_buttons.dart';
import 'package:digitalsalt_assignment/view/common_widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _signUpEmailController = TextEditingController();
  final TextEditingController _signUpPasswordController =
      TextEditingController();

  final FocusNode _signUpEmailFocusNode = FocusNode();
  final FocusNode _signUpPasswordFocusNode = FocusNode();

  bool _obscureText = true;
  bool _agreedToTerms = false;
  String email = '';
  String password = '';

  @override
  void dispose() {
    _signUpEmailController.dispose();
    _signUpPasswordController.dispose();
    _signUpEmailFocusNode.dispose();
    _signUpPasswordFocusNode.dispose();
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
                "Sign Up",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColor.ktxtprimary),
              ),
              const Gap(10),
              const Text(
                "Enter your details below & free sign up",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.klightGrey),
              ),
              const Gap(40),
              CustomInputField(
                  textController: _signUpEmailController,
                  focusNode: _signUpEmailFocusNode,
                  onSubmit: (_) => Utils.fieldFocusChange(
                      context, _signUpEmailFocusNode, _signUpPasswordFocusNode),
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
                  textController: _signUpPasswordController,
                  focusNode: _signUpPasswordFocusNode,
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
              const Gap(24),
              PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (!_agreedToTerms) {
                        Utils.toastMessage(
                            'Please agree to the terms and conditions');
                        return;
                      }
                      Utils.snackBar('Success', 'Account created successfully');
                      log('Creating account with email: ${_signUpEmailController.text}');
                    }
                  },
                  title: 'Creat account'),
              const Gap(16),
              Row(
                children: [
                  Checkbox(
                    value: _agreedToTerms,
                    activeColor: AppColor.kprimaryColor,
                    checkColor: AppColor.kwhite,
                    onChanged: (value) {
                      setState(() {
                        _agreedToTerms = value ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "By creating an account you have to agree with our them & condication.",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColor.ktxtsecondary),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account ?",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.ktxtsecondary),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(()=> const LogInPage());
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w600,
                          color: AppColor.kprimaryColor),
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
