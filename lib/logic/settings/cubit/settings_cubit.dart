import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';
part 'settings_cubit.g.dart';

class SettingsCubit extends Cubit<SettingsState> with HydratedMixin {
  SettingsCubit() : super(const SettingsState());

  void updateSettings(SettingsState newSettingsState) {
    emit(newSettingsState);
  }

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toJson();
  }

  static bool buildWhen(SettingsState previous, SettingsState current) {
    // Rebuild the whole app only if the themeMode
    // darkDuringDayInAutoMode, appLanguague changes
    // or theme sytem

    return previous.themeMode != current.themeMode ||
        previous.darkDuringDayInAutoMode != current.darkDuringDayInAutoMode ||
        previous.appLanguague != current.appLanguague ||
        previous.themeSystem != current.themeSystem;
  }
}
