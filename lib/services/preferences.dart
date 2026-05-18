import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Set Function
  Future setUserName(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Name", value);
  }

  Future setEmail(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Email", value);
  }

  Future setGoal(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Goal", value);
  }

  Future setGender(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Gender", value);
  }

  Future setActive(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Active", value);
  }

  Future setHeight(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Height", value);
  }

  Future setWeight(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Weight", value);
  }

  Future setAge(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Age", value);
  }

  Future setCalories(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Calories", value);
  }
  Future setProtein(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Proteins", value);
  }
  Future setFats(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Fats", value);
  }
  Future setCarbs(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("Carbs", value);
  }

  // Get Function

  Future getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Name");
  }

  Future getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Email");
  }

  Future getGoal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Goal");
  }

  Future getGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Gender");
  }

  Future getActive() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Active");
  }

  Future getHeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Height");
  }

  Future getWeight() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Weight");
  }

  Future getAge() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Age");
  }

  Future getCalories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Calories");
  }
  Future getProtein() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Proteins");
  }
  Future getFats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Fats");
  }
  Future getCarbs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("Carbs");
  }

  // Consumed Nutrients
  Future setConsumedCalories(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("ConsumedCalories", value);
  }
  Future setConsumedProtein(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("ConsumedProteins", value);
  }
  Future setConsumedFats(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("ConsumedFats", value);
  }
  Future setConsumedCarbs(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("ConsumedCarbs", value);
  }

  Future getConsumedCalories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("ConsumedCalories") ?? "0";
  }
  Future getConsumedProtein() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("ConsumedProteins") ?? "0";
  }
  Future getConsumedFats() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("ConsumedFats") ?? "0";
  }
  Future getConsumedCarbs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("ConsumedCarbs") ?? "0";
  }
}
