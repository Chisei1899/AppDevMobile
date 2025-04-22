import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                    icon: SvgPicture.asset(
                      selectedIndex == 0 ? 'images/Home_Selected.svg' : 'images/Home.svg',
                      height: 50,
                      width: 50,
                    ),
                    isSelected: selectedIndex == 0,
                    onTap: () => onItemTapped(0),
                  ),
                  // Jobs
                  NavBarItem(
                    icon: SvgPicture.asset(
                      selectedIndex == 1 ? 'images/Jobs_Selected.svg' : 'images/Jobs.svg',
                      height: 50,
                      width: 50,
                    ),
                    isSelected: selectedIndex == 1,
                    onTap: () => onItemTapped(1),
                  ),
                  const SizedBox(width: 50),
                  // Messages
                  NavBarItem(
                    icon: SvgPicture.asset(
                      selectedIndex == 2 ? 'images/Messages_Selected.svg' : 'images/Messages.svg',
                      height: 50,
                      width: 50,
                    ),
                    isSelected: selectedIndex == 2,
                    onTap: () => onItemTapped(2),
                  ),
                  // Profile
                  NavBarItem(
                    icon: SvgPicture.asset(
                      selectedIndex == 3 ? 'images/Profile_Selected.svg' : 'images/Profile.svg',
                      height: 50,
                      width: 50,
                    ),
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
              child: CenterButton(
                isSelected: selectedIndex == 4, // NEW: 4 is Post
                onTap: () => onItemTapped(4),
              ),
            ),
          ),

// Blue indicator line (invisible if Post button is selected)
          if (selectedIndex != 4)
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