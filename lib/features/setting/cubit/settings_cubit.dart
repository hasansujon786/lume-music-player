import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());
}

class SettingsState extends Equatable {
  const SettingsState();

  factory SettingsState.initial() => SettingsState();

  SettingsState copyWith() {
    return SettingsState();
  }

  @override
  List<Object?> get props => [];
}
