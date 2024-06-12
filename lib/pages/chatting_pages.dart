import 'package:flutter/material.dart';

class ChattingPages extends StatefulWidget {
  const ChattingPages({super.key, required this.uid, required this.userName});
  final String uid;
  final String userName;

  @override
  State<ChattingPages> createState() => _ChattingPagesState();
}

class _ChattingPagesState extends State<ChattingPages> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}