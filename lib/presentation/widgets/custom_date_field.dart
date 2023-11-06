import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDateField extends StatelessWidget {
  final Function(DateTime) onTap;
  final String? date;

  const CustomDateField({super.key, required this.onTap, required this.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _getDate(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitle(),
            _buildContent(),
          ],
        ),
      ),
    );
  }

  Container _buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromARGB(255, 2, 106, 154),
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            date ?? 'Choose your date of birth',
            style: TextStyle(
              fontSize: 15,
              color: (date != null) ? Colors.black : Colors.grey[600],
            ),
          ),
          const Icon(Icons.calendar_today, size: 20)
        ],
      ),
    );
  }

  Padding _buildTitle() {
    return const Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Text(
        'Age',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Color.fromARGB(255, 2, 106, 154),
        ),
      ),
    );
  }

  void _getDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: (date != null)
          ? DateFormat.yMd().parse(date!)
          : DateTime.now().subtract(const Duration(days: 365 * 20)),
      firstDate: DateTime(1940),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 15)),
    ).then((value) {
      if (value == null) return;

      onTap(value);
    });
  }
}
