import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefOperator {

  final SharedPreferences sharedPreferences;
  SharedPrefOperator(this.sharedPreferences);

   setUserEmail(String email) {
    sharedPreferences.setString("userEmail", email);
  }

  String getUserEmail() {
    return sharedPreferences.getString("userEmail") ?? "";
  }
}
