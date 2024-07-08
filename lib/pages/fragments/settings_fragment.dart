import 'package:d_session/d_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_motobike/models/account.dart';
import 'package:gap/gap.dart';

class SettingsFragment extends StatefulWidget {
  const SettingsFragment({super.key});

  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  logout() {
    DSession.removeUser().then((removed) {
      if(!removed) return;

      Navigator.pushReplacementNamed(context, '/signin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        Gap(20+MediaQuery.of(context).padding.top),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Settings",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xff070623)
            ),
          ),
        ),
        const Gap(20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              buildProfile(),
              buildItemSettings(
                'assets/ic_profile.png',
                'Edit Profile',
                null
              ),
              const Gap(30),
              buildItemSettings(
                'assets/ic_wallet.png',
                'My Digital Wallet',
                null
              ),
              const Gap(20),
              buildItemSettings(
                'assets/ic_rate.png',
                'Rate This App',
                null
              ),
              const Gap(20),
              buildItemSettings(
                'assets/ic_key.png',
                'Change Passwowrd',
                null
              ),
              const Gap(20),
              buildItemSettings(
                'assets/ic_interest.png',
                'Interest Personalized',
                null
              ),
              const Gap(20),
              buildItemSettings(
                'assets/ic_logout.png',
                'Logout',
                logout
              ),
              const Gap(20),
            ],
          ),
        )
      ],
    );
  }

  Widget buildItemSettings(
    String icon,
    String name,
    VoidCallback? onTap
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: const Color(0xffEFEEF7),
            width: 1
          )
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24,
              height: 24,
            ),
            const Gap(14),
            Expanded(
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff070623)
                ),
              ),
            ),
            Image.asset(
              'assets/ic_arrow_next.png',
              width: 20,
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfile() {
    return FutureBuilder(
      future: DSession.getUser(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        Account account = Account.fromJson(Map.from(snapshot.data!));
        return Row(
          children: [
            Image.asset(
              'assets/profile.png',
              width: 50,
              height: 50,
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  account.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff070623)
                  ),
                ),
                Text(
                  account.email,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff838384)
                  ),
                ),
              ],
            )
          ],
        );
      }
    );
  }
}