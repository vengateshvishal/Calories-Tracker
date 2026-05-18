import 'package:calorie_tracker/Screens/rootScreen.dart';
import 'package:calorie_tracker/models/food_data.dart';
import 'package:calorie_tracker/services/preferences.dart';
import 'package:flutter/material.dart';

class AddMealsScreen extends StatefulWidget {
  const AddMealsScreen({super.key});

  @override
  State<AddMealsScreen> createState() => _AddMealsScreenState();
}

class _AddMealsScreenState extends State<AddMealsScreen> {
  void searchFood(String query) {
    final sugge = allFood.where((food) {
      final foodTitle = food.foodName.toLowerCase();
      final input = query.toLowerCase();

      return foodTitle.contains(input);
    }).toList();

    setState(() {
      foodList = sugge;
    });
  }

  final TextEditingController _searchController = TextEditingController();
  var foodList = allFood;

  void _showFoodDialog(BuildContext context, FoodData food) {
    TextEditingController gramsController = TextEditingController(text: '100');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            double multiplier =
                (int.tryParse(gramsController.text) ?? 0) / 100.0;

            return AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: const EdgeInsets.all(20),
              title: Center(
                child: Text(
                  food.foodName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            (food.calories * multiplier).toStringAsFixed(0),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Calories',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${(food.proteins * multiplier).toStringAsFixed(1)}g',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Proteins',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${(food.fats * multiplier).toStringAsFixed(1)}g',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Fats',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${(food.carbs * multiplier).toStringAsFixed(1)}g',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Carbs',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove, color: Colors.teal),
                        onPressed: () {
                          int currentVal =
                              int.tryParse(gramsController.text) ?? 0;
                          if (currentVal > 100) {
                            gramsController.text = (currentVal - 100)
                                .toString();
                            setState(() {});
                          }
                        },
                      ),
                      SizedBox(
                        width: 80,
                        child: TextField(
                          controller: gramsController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          onChanged: (val) {
                            setState(() {});
                          },
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal),
                            ),
                          ),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.teal),
                        onPressed: () {
                          int currentVal =
                              int.tryParse(gramsController.text) ?? 0;
                          gramsController.text = (currentVal + 100).toString();
                          setState(() {});
                        },
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'grams',
                        style: TextStyle(color: Colors.teal, fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    double addedCalories = food.calories * multiplier;
                    double addedProteins = food.proteins * multiplier;
                    double addedFats = food.fats * multiplier;
                    double addedCarbs = food.carbs * multiplier;

                    final helper = SharedPreferencesHelper();
                    
                    double currentCalories = double.tryParse(await helper.getConsumedCalories()) ?? 0.0;
                    double currentProteins = double.tryParse(await helper.getConsumedProtein()) ?? 0.0;
                    double currentFats = double.tryParse(await helper.getConsumedFats()) ?? 0.0;
                    double currentCarbs = double.tryParse(await helper.getConsumedCarbs()) ?? 0.0;

                    await helper.setConsumedCalories((currentCalories + addedCalories).toString());
                    await helper.setConsumedProtein((currentProteins + addedProteins).toString());
                    await helper.setConsumedFats((currentFats + addedFats).toString());
                    await helper.setConsumedCarbs((currentCarbs + addedCarbs).toString());

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Rootscreen()),
                      (route) => false,
                    );
                  },
                  child: const Text('OK', style: TextStyle(color: Colors.teal)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search food',
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                        ),
                        border: InputBorder.none,
                        suffixIcon: _searchController.text.isNotEmpty
                            ? IconButton(
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  _searchController.clear();
                                  searchFood('');
                                },
                              )
                            : null,
                      ),
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      onChanged: searchFood,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _searchController.text.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Empty',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Type a food name',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: foodList.length,
                      itemBuilder: (context, index) {
                        final food = foodList[index];
                        return ListTile(
                          title: Text(food.foodName),
                          subtitle: Text("${food.calories} cal / 100g"),
                          onTap: () {
                            _showFoodDialog(context, food);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
