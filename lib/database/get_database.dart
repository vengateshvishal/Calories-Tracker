import 'package:cloud_firestore/cloud_firestore.dart';

class GetDatabase {
  Future getUserGoal(String Id) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Goal")
        .get();
    if (docSnapshot.exists) {
      return docSnapshot.data()?['Goal']?.toString();
    }
    return null;
  }

  Future getUserGender(String Id) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Gender")
        .get();
    if (docSnapshot.exists) {
      return docSnapshot.data()?['Gender']?.toString();
    }
    return null;
  }

  Future getUserActive(String Id) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Active")
        .get();
    if (docSnapshot.exists) {
      return docSnapshot.data()?['Active']?.toString();
    }
    return null;
  }

  Future getUserHeight(String Id) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Height")
        .get();
    if (docSnapshot.exists) {
      return docSnapshot.data()?['Height']?.toString();
    }
    return null;
  }

  Future getUserWeight(String Id) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Weight")
        .get();
    if (docSnapshot.exists) {
      return docSnapshot.data()?['Weight']?.toString();
    }
    return null;
  }

  // get_database.dart

  Future<String?> getUserAge(String Id) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("Age")
        .get();

    if (docSnapshot.exists) {
      return docSnapshot.data()?['Age']?.toString();
    }
    return null;
  }

  Future getUserCalories(String Id) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("userPFC")
        .get();
    if (docSnapshot.exists) {
      return docSnapshot.data()?['calories']?.toString();
    }
    return null;
  }

  Future getUserProtein(String Id) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("userPFC")
        .get();
    if (docSnapshot.exists) {
      return docSnapshot.data()?['protein']?.toString();
    }
    return null;
  }

  Future getUserFats(String Id) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("userPFC")
        .get();
    if (docSnapshot.exists) {
      return docSnapshot.data()?['fats']?.toString();
    }
    return null;
  }

  Future getUserCarbs(String Id) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(Id)
        .collection("Details")
        .doc("userPFC")
        .get();
    if (docSnapshot.exists) {
      return docSnapshot.data()?['carbs']?.toString();
    }
    return null;
  }


}
