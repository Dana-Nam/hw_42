import 'package:flutter/material.dart';
import 'package:hw_42/models/cocktail_model.dart';
import 'package:hw_42/screens/cocktail_screen.dart';

class CocktailGrid extends StatelessWidget {
  final List<Cocktail> cocktails;

  const CocktailGrid({super.key, required this.cocktails});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cocktails.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 300,
      ),
      itemBuilder: (ctx, i) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CocktailScreen(cocktail: cocktails[i]),
            ),
          );
        },
        child: Column(
          children: [
            Image.network(
              cocktails[i].imageUrl,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 8),
            Text(
              cocktails[i].name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
