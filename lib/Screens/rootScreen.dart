import 'package:calorie_tracker/Screens/homepage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class Rootscreen extends StatefulWidget {
  const Rootscreen({super.key});

  @override
  State<Rootscreen> createState() => _RootscreenState();
}

class _RootscreenState extends State<Rootscreen> {
  int currenIndex = 1;
  final List<Widget> pages = [
    Center(child: Text("Recipes")),
    HomePage(),
    Center(child: Text("Reports")),
  ];

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isSelected = currenIndex == index;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? Colors.white : const Color(0xff35CC8C),
          size: isSelected ? 32 : 26,
        ),
        if (!isSelected) const SizedBox(height: 4),
        if (!isSelected)
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff35CC8C),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffDBFBED),
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        child: Scaffold(
          extendBody: true,
          body: pages[currenIndex],
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.transparent,
            color: const Color(0xffDBFBED),
            buttonBackgroundColor: const Color(0xff35CC8C),
            index: currenIndex,
            animationDuration: const Duration(milliseconds: 700),
            onTap: (index) {
              setState(() {
                currenIndex = index;
              });
            },
            items: [
              _buildNavItem(Icons.menu_book, "Recipes", 0),
              _buildNavItem(Icons.event_available, "Diary", 1),
              _buildNavItem(Icons.bar_chart_rounded, "Reports", 2),
            ],
          ),
        ),
      ),
    );
  }
}
