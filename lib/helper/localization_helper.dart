import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragnancy_app/bloc/localization/localization_bloc.dart';

String getLocalized(BuildContext context, String key) {
  final state = context.read<LocalizationBloc>().state;
  return state.localizedStrings[key] ?? key;
}