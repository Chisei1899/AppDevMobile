import 'package:flutter/material.dart';
import 'package:navbar_app/widgets/nav_bar_item.dart';
import 'package:navbar_app/widgets/center_button.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 94,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 59,
              decoration: const BoxDecoration(
                color: Color(0xFFCEDBF1),
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFE0E0E0),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Home
                  NavBarItem(
                    iconData: Icons.home_outlined,
                    label: 'Home',
                    isSelected: selectedIndex == 0,
                    onTap: () => onItemTapped(0),
                  ),
                  // Jobs
                  NavBarItem(
                    iconData: Icons.work_outline,
                    label: 'Jobs',
                    isSelected: selectedIndex == 1,
                    onTap: () => onItemTapped(1),
                  ),
                  const SizedBox(width: 50),
                  // Messages
                  NavBarItem(
                    iconData: Icons.message_outlined,
                    label: 'Messages',
                    isSelected: selectedIndex == 2,
                    onTap: () => onItemTapped(2),
                  ),
                  // Profile
                  NavBarItem(
                    iconData: Icons.person_outline,
                    label: 'Profile',
                    isSelected: selectedIndex == 3,
                    onTap: () => onItemTapped(3),
                  ),
                ],
              ),
            ),
          ),

          // Floating center button
          Positioned(
            top: -10,
            left: 0,
            right: 0,
            child: Center(
              child: CenterButton(),
            ),
          ),

          // Blue indicator line
          Positioned(
            bottom: 58,
            left: selectedIndex == 0
                ? 18
                : (selectedIndex == 1
                ? 91
                : (selectedIndex == 2
                ? 244
                : 322)),
            child: Container(
              width: 70,
              height: 2,
              color: const Color(0xFF090C9B),
            ),
          ),
        ],
      ),
    );
  }
}