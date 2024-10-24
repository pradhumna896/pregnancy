import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static SharedPreferences? preferences;
  static const _user = "access_token";
  static const _token = "token";
  static const _userId = "userId";
  static const _userType = "userType";
  static const _maternityId = "maternityId";
  static const _role = "role";
  static const _permissions = "permissions";
  static const _language = "language";
  static const _userName = "userName";

  /// for switch user

  static const _userIdSwitch = "userIdSwitch";
  static const _userTypeSwitch = "userTypeSwitch";
  static const _maternityIdSwitch = "maternityIdSwitch";
  static const _userNameSwitch = "userNameSwitch";

  /// for switch account

  static Future init() async => preferences = await SharedPreferences.getInstance();

  static dynamic setLanguage(String language) {
    return preferences!.setString(_language, language);
  }

  static String? getLanguage() {
    return preferences!.getString(_language);
  }

  static dynamic setUser(String user) {
    return preferences!.setString(_user, user);
  }

  static String? getUser() {
    return preferences!.getString(_user);
  }

  static dynamic setUserId(String userId) {
    return preferences!.setString(_userId, userId);
  }
  static String? getMaternityId() {
    return preferences!.getString(_maternityId);
  }

  static dynamic setMaternityId(String maternityId) {
    return preferences!.setString(_maternityId, maternityId);
  }

  static String? getUserId() {
    return preferences!.getString(_userId);
  }

  static dynamic setToken(String token) {
    return preferences!.setString(_token, token);
  }

  static dynamic getToken() {
    return preferences!.getString(_token);
  }

  static dynamic setRole(String role) {
    return preferences!.setString(_role, role);
  }

  static dynamic getRole() {
    return preferences!.getString(_role);
  }
  static dynamic setName(String userName) {
    return preferences!.setString(_userName, userName);
  }

  static dynamic getName() {
    return preferences!.getString(_userName);
  }
  static dynamic setUserType(String userType) {
    return preferences!.setString(_userType, userType);
  }

  static dynamic getUserType() {
    return preferences!.getString(_userType);
  }

  static dynamic setPermissions(List<String> permission) {
    return preferences!.setStringList(_permissions, permission);
  }

  static dynamic getPermissions() {
    return preferences!.getStringList(_permissions);
  }

  static dynamic removeToken() {
    return preferences!.remove(_token);
  }

  /// for switch account

  static dynamic setUserIdSwitch(String userIdSwitch) {
    return preferences!.setString(_userIdSwitch, userIdSwitch);
  }
  static String? getUserIdSwitch() {
    return preferences!.getString(_userIdSwitch);
  }

  static dynamic setUserTypeSwitch(String userTypeSwitch) {
    return preferences!.setString(_userTypeSwitch, userTypeSwitch);
  }
  static String? getUserTypeSwitch() {
    return preferences!.getString(_userTypeSwitch);
  }

  static dynamic setMaternityIdSwitch(String maternityIdSwitch) {
    return preferences!.setString(_maternityIdSwitch, maternityIdSwitch);
  }
  static String? getMaternityIdSwitch() {
    return preferences!.getString(_maternityIdSwitch);
  }

  static dynamic setNameSwitch(String userNameSwitch) {
    return preferences!.setString(_userNameSwitch, userNameSwitch);
  }
  static String? getNameSwitch() {
    return preferences!.getString(_userNameSwitch);
  }

}
