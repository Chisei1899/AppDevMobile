import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;

  const NavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0, // remove shadow
      color: Colors.transparent, // ensure no conflicting background
      surfaceTintColor: Colors.transparent, // prevent Material 3 overlay
      child: Container(
        height: 70, // fixed height to eliminate extra spacing
        padding: EdgeInsets.zero, // no extra padding
        margin: EdgeInsets.zero,
        color: Colors.lightBlueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavColumn(0, Icons.home_outlined, 'Home'),
                  _buildNavColumn(1, Icons.cases_outlined, 'Jobs'),
                ],
              ),
            ),
            const SizedBox(width: 48), // leave room for FAB
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavColumn(2, Icons.message_outlined, 'Messages'),
                  _buildNavColumn(3, Icons.account_circle_outlined, 'Profile'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavColumn(int index, IconData icon, String label) {
    final bool selected = pageIndex == index;

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center, // center items vertically
      children: [
        // Top bar indicator
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 2,
          width: 60,
          decoration: BoxDecoration(
            color: selected ? Colors.purple : Colors.transparent,
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        const SizedBox(height: 8),
        navItem(
          icon,
          selected,
          onTap: () => onTap(index),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: selected ? Colors.purple : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Icon(
        icon,
        color: selected ? Colors.purple : Colors.black,
      ),
    );
  }
}