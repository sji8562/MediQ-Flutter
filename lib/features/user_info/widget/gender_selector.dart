import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final String? selected;
  final ValueChanged<String> onChanged;

  const GenderSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Widget buildButton(String label, String value) {
      final isSelected = selected == value;
      final primary = Theme.of(context).colorScheme.primary;

      return Expanded(
        child: GestureDetector(
          onTap: () => onChanged(value),
          child: Container(
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isSelected ? primary.withOpacity(0.1) : Colors.transparent,
              border: Border.all(
                color: isSelected ? primary : Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? primary : Colors.grey.shade700,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    }

    return Row(
      children: [
        buildButton('남성', 'M'),
        const SizedBox(width: 12),
        buildButton('여성', 'F'),
      ],
    );
  }
}
