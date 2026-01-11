import 'package:fintech_app/features/profile/presentation/widgets/general_section.dart';
import 'package:fintech_app/features/profile/presentation/widgets/header_section.dart';
import 'package:fintech_app/features/profile/presentation/widgets/settings_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 20.h),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderSection(),
                GeneralSection(),
                SettingsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
