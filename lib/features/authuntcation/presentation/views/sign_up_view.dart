import 'package:educational_app/features/authuntcation/presentation/views/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return const  SafeArea(
      child: Scaffold(
        body: SignupBody(),
      ),
    );
  }
}
