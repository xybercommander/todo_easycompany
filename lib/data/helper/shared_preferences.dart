import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static String loggedInSharedPreferenceKey = "LOGGEDINKEY";
  static String emailSharedPreferenceKey = "EMAILKEY";
  static String nameSharedPreferenceKey = "NAMEKEY";

  //-------- SET FUNCTION --------//
  static Future<bool> saveLoggedInSharedPreference(bool isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(loggedInSharedPreferenceKey, isUserLoggedIn);
  }

  static Future<bool> saveEmailSharedPreference(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(emailSharedPreferenceKey, email);
  }

  static Future<bool> saveNameSharedPreference(String name) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameSharedPreferenceKey, name);
  }

  //-------- GET FUNCTION --------//
  static Future<bool?> getLoggedInSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(loggedInSharedPreferenceKey);
  }
  
  static Future<String?> getEmailSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(emailSharedPreferenceKey);
  }
  
  static Future<String?> getNameSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameSharedPreferenceKey);
  }

}