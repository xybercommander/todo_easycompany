import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static String tasksSharedPreferenceKey = "TASKSKEY";  

  //-------- SET FUNCTION --------//
  Future<bool> saveTasksSharedPreference(String tasks) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(tasksSharedPreferenceKey, tasks);
  }

  //-------- GET FUNCTION --------//
  Future<String?> getTasksSharedPreference() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(tasksSharedPreferenceKey);
  }

}