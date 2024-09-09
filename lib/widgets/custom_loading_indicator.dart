import 'package:flutter/material.dart';

class CutomLoadingIndicator extends StatelessWidget {
  const CutomLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
        ));
  }
}
