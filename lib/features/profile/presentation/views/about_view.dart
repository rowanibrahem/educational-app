
import 'package:educational_app/core/shared_widget/custom_appbar.dart';
import 'package:educational_app/features/profile/presentation/views/widgets/about_us_body.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        appBar: CustomAppBarTitle(
          text: 'About Us',
         ),
        body:  AboutBody(),
      ),
    );
  }
}
