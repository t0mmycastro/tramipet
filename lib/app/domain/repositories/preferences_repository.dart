abstract class PreferencesRepository {
  bool get isDarkModeAlias;
  Future<void> darkMode(bool enabled);
}
