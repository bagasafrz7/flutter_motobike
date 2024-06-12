import 'package:flutter/material.dart';
import 'package:flutter_motobike/models/bike.dart';

class PinPages extends StatefulWidget {
  const PinPages({super.key, required this.bike});
  final Bike bike;

  @override
  State<PinPages> createState() => _PinPagesState();
}

class _PinPagesState extends State<PinPages> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}