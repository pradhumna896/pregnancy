import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pragnancy_app/comman/routes/routes.dart';
import 'package:pragnancy_app/view/auth/screen/login_screen.dart';

FutureOr<void> Function(OperationException?)? authorized(context) {
  SessionManager.removeToken();

  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
    (route) => false,
  );
  return null;
}
