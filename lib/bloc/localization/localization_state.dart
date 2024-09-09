// localization_state.dart
import 'package:equatable/equatable.dart';

class LocalizationState extends Equatable {
  final Map<String, String> localizedStrings;
  final String locale;

  const LocalizationState(this.localizedStrings, this.locale);

  @override
  List<Object> get props => [localizedStrings, locale];
}
