import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  Future addUserGoal(Map<String, dynamic> userGoal, String Id) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Goal")
        .set(userGoal);
    return "Sucess";
  }

  Future addUserGender(Map<String, dynamic> userGender, String Id) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Gender")
        .set(userGender);
    return "Sucess";
  }

  Future addUserActive(Map<String, dynamic> userActive, String Id) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Active")
        .set(userActive);
    return "Sucess";
  }

  Future addUserHeight(Map<String, dynamic> userHeight, String Id) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Height")
        .set(userHeight);
    return "Sucess";
  }

  Future addUserWeight(Map<String, dynamic> userWeight, String Id) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Weight")
        .set(userWeight);
    return "Sucess";
  }

  Future addUserAge(Map<String, dynamic> userAge, String Id) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Age")
        .set(userAge);
    return "Sucess";
  }

  Future addUserCalories(Map<String, dynamic> userPFC, String Id) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("userPFC")
        .set(userPFC);
    return "Sucess";
  }
}
