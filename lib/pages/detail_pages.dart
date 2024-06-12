import 'package:flutter/material.dart';

class DetailPages extends StatefulWidget {
  const DetailPages({super.key, required this.bikeId});
  final String bikeId;

  @override
  State<DetailPages> createState() => _DetailPagesState();
}

class _DetailPagesState extends State<DetailPages> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}