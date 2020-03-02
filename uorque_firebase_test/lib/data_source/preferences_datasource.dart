import 'package:shared_preferences/shared_preferences.dart';


class PreferencesDataSource{
  static const _CURRENT_USER_EMAIL_PREF = "currenteUserEmail"; 

  Future<String> getCurrentUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String email =  prefs.getString( _CURRENT_USER_EMAIL_PREF);
    return email;
  }

  void setCurrentUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_CURRENT_USER_EMAIL_PREF, email);  
  }
}