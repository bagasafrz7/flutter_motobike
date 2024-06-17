import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_motobike/common/info.dart';
import 'package:flutter_motobike/sources/auth_source.dart';
import 'package:flutter_motobike/widgets/button_primary.dart';
import 'package:flutter_motobike/widgets/button_secondary.dart';
import 'package:flutter_motobike/widgets/input.dart';
import 'package:gap/gap.dart';

class SignInPages extends StatefulWidget {
  const SignInPages({super.key});

  @override
  State<SignInPages> createState() => _SignInPagesState();
}

class _SignInPagesState extends State<SignInPages> {
  final edtEmail = TextEditingController();
  final edtPassword = TextEditingController();

  signIn() {
    if(edtEmail.text == '') return Info.error('Email is required');
    if(edtPassword.text == '') return Info.error('Password is required');

    Info.netral("Loading..");
    AuthSource.signIn(
      edtEmail.text,
      edtPassword.text
    ).then((message) {
      if(message!='success') return Info.error(message);

      Info.success("Success Sign In");
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.pushReplacementNamed(context, '/discover');
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
            'Sign In Account',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff070623)
            ),
          ),
          const Gap(30),
          const Gap(12),
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
          ButtonPrimary(text: 'Sign In', onTap: signIn),
          const Gap(30),
          const DottedLine(
            dashLength: 6,
            dashGapLength: 6,
            dashColor: Color(0xffCECED5),
          ),
          const Gap(30),
          ButtonSecondary(text: 'Create New Account', onTap: () {
            Navigator.pushReplacementNamed(context, '/signup');
          }),
          const Gap(30),
        ],
      ),
    );
  }
}