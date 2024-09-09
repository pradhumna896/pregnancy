import 'package:flutter/material.dart';
import '../theme/theme_helper.dart';

floatingButton(BuildContext context, String routeName, {Object? arguments}) {
  return FloatingActionButton(
    backgroundColor: appTheme.orange,
    child: Icon(
      Icons.add,
      color: appTheme.whiteA700,
    ),
    onPressed: () {
      Navigator.pushNamed(context, routeName, arguments: arguments);
    },
  );
}
