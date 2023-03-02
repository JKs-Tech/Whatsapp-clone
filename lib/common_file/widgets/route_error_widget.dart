import 'package:flutter/material.dart';

class RouteErrorScreen extends StatelessWidget {
  final String error;
  const RouteErrorScreen({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
