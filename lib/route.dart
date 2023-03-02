import 'package:flutter/material.dart';
import 'package:whatsapp/common_file/widgets/route_error_widget.dart';
import 'package:whatsapp/futures/auth/screens/login_screen.dart';
import 'package:whatsapp/futures/auth/screens/otp_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: RouteErrorScreen(error: "This Page Dosen't Exist"),
        ),
      );
  }
}
