import 'package:calorie_tracker/services/preferences.dart';
import 'package:calorie_tracker/database/get_database.dart';

class Functions {
  Future<Map<String, String?>> getHomePageData() async {
    final helper = SharedPreferencesHelper();
    return {
      'name': await helper.getUserName() as String?,
      'protein': await helper.getProtein() as String?,
      'fats': await helper.getFats() as String?,
      'carbs': await helper.getCarbs() as String?,
      'calories': await helper.getCalories() as String?,
      'consumedProtein': await helper.getConsumedProtein() as String?,
      'consumedFats': await helper.getConsumedFats() as String?,
      'consumedCarbs': await helper.getConsumedCarbs() as String?,
      'consumedCalories': await helper.getConsumedCalories() as String?,
    };
  }

  Future fetchAndStoreUserData(String uid) async {
    final getDatabase = GetDatabase();
    final helper = SharedPreferencesHelper();

    final goal = await getDatabase.getUserGoal(uid);
    if (goal != null) await helper.setGoal(goal);

    final gender = await getDatabase.getUserGender(uid);
    if (gender != null) await helper.setGender(gender);

    final active = await getDatabase.getUserActive(uid);
    if (active != null) await helper.setActive(active);

    final height = await getDatabase.getUserHeight(uid);
    if (height != null) await helper.setHeight(height);

    final weight = await getDatabase.getUserWeight(uid);
    if (weight != null) await helper.setWeight(weight);

    final age = await getDatabase.getUserAge(uid);
    if (age != null) await helper.setAge(age);

    final calories = await getDatabase.getUserCalories(uid);
    if (calories != null) await helper.setCalories(calories);

    final protein = await getDatabase.getUserProtein(uid);
    if (protein != null) await helper.setProtein(protein);

    final fats = await getDatabase.getUserFats(uid);
    if (fats != null) await helper.setFats(fats);

    final carbs = await getDatabase.getUserCarbs(uid);
    if (carbs != null) await helper.setCarbs(carbs);
  }

  Future recommendPFC() async {
    // 1. Fetch data once
    final helper = SharedPreferencesHelper();
    final String gender = await helper.getGender();
    final double weight = double.tryParse(await helper.getWeight()) ?? 0;
    final double height = double.tryParse(await helper.getHeight()) ?? 0;
    final int age = int.tryParse(await helper.getAge()) ?? 0;
    final String active = await helper.getActive();
    final String goal = await helper.getGoal();

    // 2. Calculate Basal Metabolic Rate (BMR)
    // Note: Your original code labeled the Mifflin-St Jeor result as TDEE.
    // Usually, the base formula is BMR, which is then multiplied to get TDEE.
    double baseMetabolicRate = (10 * weight) + (6.25 * height) - (5 * age);
    baseMetabolicRate += (gender == "Male") ? 5 : -161;

    // 3. Apply Activity Multiplier (TDEE)
    Map<String, double> activityFactors = {
      "Sedentary": 1.2,
      "Low Active": 1.375,
      "Active": 1.55,
      "Very Active": 1.725,
    };
    double tdee = baseMetabolicRate * (activityFactors[active] ?? 1.2);

    // 4. Adjust for Goals
    double finalCalories = tdee;
    if (goal == "Lose weight") {
      finalCalories -= 500;
    } else if (goal == "Gain weight") {
      finalCalories += 500;
    }
    print(finalCalories.toInt());

    int totalCalories = finalCalories.toInt();

    // --- Macro Calculations ---
    // Using your logic: 30% Protein, 35% Fats, remaining Carbs
    int protein = ((totalCalories * 0.30) / 4).round();
    int fats = ((totalCalories * 0.35) / 9).round();
    int carbs = ((totalCalories - (protein * 4) - (fats * 9)) / 4).round();
    return {
      "calories": totalCalories,
      "protein": protein,
      "fats": fats,
      "carbs": carbs,
    };
  }
}
