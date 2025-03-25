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
      elevation: 0.0,
      child: ClipRRect(
        child: Container(
          color: Colors.lightBlueAccent,
          padding: const EdgeInsets.symmetric(vertical: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: _buildNavColumn(0, Icons.home_outlined, 'Home'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: _buildNavColumn(1, Icons.cases_outlined, 'Jobs'),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 48),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: _buildNavColumn(2, Icons.message_outlined, 'Messages'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: _buildNavColumn(3, Icons.account_circle_outlined, 'Profile'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavColumn(int index, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        navItem(
          icon,
          pageIndex == index,
          onTap: () => onTap(index),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: pageIndex == index ? Colors.purple : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: selected ? Colors.purple : Colors.black,
        ),
      ),
    );
  }
}