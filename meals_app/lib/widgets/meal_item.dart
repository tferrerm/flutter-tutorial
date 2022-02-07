import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String? imageURL;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem(
      {Key? key,
      required this.title,
      required this.duration,
      required this.complexity,
      required this.affordability,
      this.imageURL})
      : super(key: key);

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageURL!, // TODO: add asset in case imageURL is not available
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ), // to use any other widget as a child and force it into a certain form
              ],
            ) // to display the title on top of the image. We need to clip the image so the rounded corners are visible
          ],
        ),
      ),
    );
  }
}
