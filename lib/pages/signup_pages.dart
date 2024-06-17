import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motobike/common/info.dart';
import 'package:flutter_motobike/sources/auth_source.dart';
import 'package:flutter_motobike/widgets/button_primary.dart';
import 'package:flutter_motobike/widgets/button_secondary.dart';
import 'package:flutter_motobike/widgets/input.dart';
import 'package:gap/gap.dart';

class SignUpPages extends StatefulWidget {
  const SignUpPages({super.key});

  @override
  State<SignUpPages> createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  final edtName = TextEditingController();
  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();

  createNewAccount() {
    if(edtName.text == '') return Info.error('Name is required');
    if(edtEmail.text == '') return Info.error('Email is required');
    if(edtPassword.text == '') return Info.error('Password is required');

    Info.netral("Loading..");
    AuthSource.signUp(
      edtName.text,
      edtEmail.text,
      edtPassword.text
    ).then((message) {
      if(message!='success') return Info.error(message);

      Info.success("Success Sign Up");
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacementNamed(context, '/signin');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 0
        ),
        children: [
          const Gap(100),
          Image.asset(
            'assets/logo_text.png',
            height: 38,
            width: 171,
          ),
          const Gap(70),
          const Text(
            'Sign Up Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff070623)
            ),
          ),
          const Gap(30),
          const Text(
            'Complete Name',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff070623)
            ),
          ),
          const Gap(12),
          Input(icon: 'assets/ic_profile.png', hint: 'Write your real name', editingController: edtName),
          const Gap(20),
          const Text(
            'Email Address',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff070623)
            ),
          ),
          const Gap(12),
          Input(icon: 'assets/ic_email.png', hint: 'Write your real email', editingController: edtEmail),
          const Gap(20),
          const Text(
            'Password',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xff070623)
            ),
          ),
          const Gap(12),
          Input(icon: 'assets/ic_key.png', hint: 'Write your password', editingController: edtPassword, obsecure: true),
          const Gap(30),
          ButtonPrimary(text: 'Create New Account', onTap: createNewAccount),
          const Gap(30),
          const DottedLine(
            dashLength: 6,
            dashGapLength: 6,
            dashColor: Color(0xffCECED5),
          ),
          const Gap(30),
          ButtonSecondary(text: 'Sign In', onTap: () {
            Navigator.pushReplacementNamed(context, '/signin');
          }),
          const Gap(30),
        ],
      ),
    );
  }
}