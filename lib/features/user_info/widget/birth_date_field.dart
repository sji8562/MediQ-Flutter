import 'package:flutter/material.dart';

class BirthDateField extends StatelessWidget {
  final DateTime? value;
  final VoidCallback onTap;

  const BirthDateField({super.key, required this.value, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: '생년월일',
            hintText: 'YYYY-MM-DD',
            suffixIcon: Icon(Icons.calendar_today_outlined),
          ),
          controller: TextEditingController(
            text: value == null
                ? ''
                : '${value!.year}-${value!.month.toString().padLeft(2, '0')}-${value!.day.toString().padLeft(2, '0')}',
          ),
        ),
      ),
    );
  }
}
