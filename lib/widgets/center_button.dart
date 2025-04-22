import 'package:flutter/material.dart';

class CenterButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CenterButton({
    super.key,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              // Outer white circle
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              // Inner blue circle
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF090C9B), // Deep blue
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Post',
            style: TextStyle(
              color: isSelected ? const Color(0xFF090C9B) : const Color(0xFF333333),
              fontFamily: 'Inter',
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}