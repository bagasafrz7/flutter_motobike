import 'package:d_session/d_session.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_motobike/firebase_options.dart';
import 'package:flutter_motobike/models/bike.dart';
import 'package:flutter_motobike/pages/booking_pages.dart';
import 'package:flutter_motobike/pages/chatting_pages.dart';
import 'package:flutter_motobike/pages/checkout_pages.dart';
import 'package:flutter_motobike/pages/detail_pages.dart';
import 'package:flutter_motobike/pages/discover_pages.dart';
import 'package:flutter_motobike/pages/pin_pages.dart';
import 'package:flutter_motobike/pages/signin_pages.dart';
import 'package:flutter_motobike/pages/signup_pages.dart';
import 'package:flutter_motobike/pages/splash_screen.dart';
import 'package:flutter_motobike/pages/success_booking.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffEFEFF0),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: FutureBuilder(
        future: DSession.getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.data == null) {
            return const SplashScreen(); // Assuming user needs to sign in if no data found
          }
          return const DiscoverPages();
        },
      ),
      routes: {
        '/discover': (context) => const DiscoverPages(),
        '/signup': (context) => const SignUpPages(),
        '/signin': (context) => const SignInPages(),
        '/detail': (context) {
          String bikeId = ModalRoute.of(context)!.settings.arguments as String;
          return DetailPages(bikeId: bikeId);
        },
        '/booking': (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return BookingPages(bike: bike);
        },
        '/checkout': (context) {
          Map data = ModalRoute.of(context)!.settings.arguments as Map;
          Bike bike = data['bike'];
          String startDate = data['startDate'];
          String endDate = data['endDate'];
          return CheckoutPages(
            bike: bike,
            startDate: startDate,
            endDate: endDate,
          );
        },
        '/pin': (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return PinPages(bike: bike);
        },
        '/success-booking': (context) {
          Bike bike = ModalRoute.of(context)!.settings.arguments as Bike;
          return SuccessBookingPages(bike: bike);
        },
        '/chatting': (context) {
          Map data = ModalRoute.of(context)!.settings.arguments as Map;
          String uid = data['uid'];
          String userName = data['userName'];
          return ChattingPages(
            uid: uid,
            userName: userName,
          );
        },
      },
    );
  }
}
