import 'package:flutter/material.dart';

class CommonHeading extends StatelessWidget {
  const CommonHeading({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: double.infinity,
      child: Row(
        children: [
          Icon(
            icon,
            size: 34,
            color: Colors.black54,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
