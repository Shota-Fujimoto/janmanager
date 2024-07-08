import 'package:flutter/material.dart';
import 'package:janmanager/presentation/thema/color_thema.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  const CategoryWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: Text(
            '$title',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: ColorThema.green
            ),
          ),
        ),
        const SizedBox(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Divider(
                  height: 2,
                  thickness: 2,
                  color: ColorThema.green,
                ),
              ),
            ],
          ),
        )
      ]
    );
  }
}