import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  Color _getChipColor(bool isSelected) {
    // ignore: unused_local_variable
    final isPriceFilter = label == "Free Events" || label == "Paid Events";
    
    if (!isSelected) return const Color(0xFFE5E7EB);
    
    if (label == "Free Events") return Colors.green;
    if (label == "Paid Events") return Colors.deepPurple;
    
    return const Color(0xFF6C63FF); // Default primary
  }

  String _getIcon() {
    switch (label) {
      case "Free Events": return "🎉";
      case "Paid Events": return "💳";
      case "Music": return "🎵";
      case "Sports": return "⚽";
      case "Technology": return "💻";
      case "Business": return "💼";
      case "Education": return "📚";
      case "Entertainment": return "🎭";
      default: return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final scheme = Theme.of(context).colorScheme;
    final chipColor = _getChipColor(isSelected);
    final icon = _getIcon();

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: isSelected ? chipColor : const Color(0xFFE5E7EB),
          borderRadius: BorderRadius.circular(30),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: chipColor.withValues(alpha: 0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon.isNotEmpty) ...[
              Text(icon, style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF374151),
                fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}