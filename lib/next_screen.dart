import 'package:flutter/material.dart';
import 'package:pragnancy_app/helper/localization_helper.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          getLocalized(context, "hello"),
        ),
      ),
    );
  }
}
