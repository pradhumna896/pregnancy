// localization_bloc.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:pragnancy_app/bloc/localization/localization_event.dart';
import 'package:pragnancy_app/bloc/localization/localization_state.dart';
import 'package:pragnancy_app/core/constants/session_manager.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  LocalizationBloc()
      : super(
            LocalizationState(const {}, SessionManager.getLanguage() ?? 'hi')) {
    on<LoadLocalization>(_onLoadLocalization);
  }

  Future<void> _onLoadLocalization(
      LoadLocalization event, Emitter<LocalizationState> emit) async {
    final String jsonString =
        await rootBundle.loadString('asset/lang/${event.locale}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);
    final localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    emit(LocalizationState(localizedStrings, event.locale));
    SessionManager.setLanguage(event.locale);
  }
}
