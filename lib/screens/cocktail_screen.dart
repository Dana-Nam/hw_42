import 'package:flutter/material.dart';
import 'package:hw_42/models/cocktail_model.dart';

class CocktailScreen extends StatelessWidget {
  final Cocktail cocktail;

  const CocktailScreen({super.key, required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cocktail.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                cocktail.imageUrl,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text('Ингредиенты:', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Column(
              children: cocktail.ingredients.map((ingredient) {
                return ListTile(
                  leading: Image.network(
                    'https://www.thecocktaildb.com/images/ingredients/$ingredient-Small.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(ingredient),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Text('Инструкция по приготовлению:',
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(cocktail.instructions,
                style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
