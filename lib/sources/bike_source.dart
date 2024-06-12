import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_motobike/models/bike.dart';

class BikeSource {
  static Future<List<Bike>?> fetchFeaturedBikes() async {
    try {
      final ref = FirebaseFirestore.instance.collection('Bikes').where('rating', isGreaterThan: 4.5).orderBy('rating', descending: true);

      final queryDoc = await ref.get();
      return queryDoc.docs.map((doc) => Bike.fromJson(doc.data())).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<List<Bike>?> fetchFNewestBikes() async {
    try {
      final ref = FirebaseFirestore.instance.collection('Bikes').orderBy('realese', descending: true).limit(4);

      final queryDoc = await ref.get();
      return queryDoc.docs.map((doc) => Bike.fromJson(doc.data())).toList();
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Bike?> fetchBike(String bikeId) async {
    try {
      final ref = FirebaseFirestore.instance.collection('Bikes').doc(bikeId);

      final doc = await ref.get();
      Bike? bike = doc.exists ? Bike.fromJson(doc.data()!) : null;

      return bike;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}