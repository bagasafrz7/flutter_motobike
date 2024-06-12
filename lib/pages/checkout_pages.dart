import 'package:flutter/material.dart';
import 'package:flutter_motobike/models/bike.dart';

class CheckoutPages extends StatefulWidget {
  const CheckoutPages({super.key, required this.bike, required this.startDate, required this.endDate});
  final Bike bike;
  final String startDate;
  final String endDate;

  @override
  State<CheckoutPages> createState() => _CheckoutPagesState();
}

class _CheckoutPagesState extends State<CheckoutPages> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}