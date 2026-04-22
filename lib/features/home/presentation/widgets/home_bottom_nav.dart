import 'package:flutter/material.dart';

class HomeBottomNav extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;
  const HomeBottomNav({super.key, required this.selectedIndex, required this.onItemTapped});

  static const List<Map<String, dynamic>> _items = [
    {'icon': Icons.home_rounded, 'label': 'Home'},
    {'icon': Icons.list_alt_rounded, 'label': 'My List'},
    {'icon': Icons.shopping_bag_outlined, 'label': 'My Order'},
    {'icon': Icons.person_outline_rounded, 'label': 'Profile'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, -3))],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(_items.length, (index) => _NavItem(
              icon: _items[index]['icon'] as IconData,
              label: _items[index]['label'] as String,
              isSelected: selectedIndex == index,
              onTap: () => onItemTapped(index),
            )),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const _NavItem({required this.icon, required this.label, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF1B4F8A) : Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 22, color: isSelected ? Colors.white : Colors.grey.shade400),
          ),
          const SizedBox(height: 2),
          Text(label, style: TextStyle(
            fontSize: 10,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? const Color(0xFF1B4F8A) : Colors.grey.shade400,
          )),
        ],
      ),
    );
  }
}