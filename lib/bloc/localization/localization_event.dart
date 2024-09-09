// localization_event.dart
import 'package:equatable/equatable.dart';

abstract class LocalizationEvent extends Equatable {
  const LocalizationEvent();

  @override
  List<Object> get props => [];
}

class LoadLocalization extends LocalizationEvent {
  final String locale;

  const LoadLocalization(this.locale);

  @override
  List<Object> get props => [locale];
}
