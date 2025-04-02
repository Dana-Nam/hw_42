class Cocktail {
  final String name;
  final String imageUrl;
  final String instructions;
  final List<String> ingredients;

  Cocktail(
      {required this.name,
      required this.imageUrl,
      required this.instructions,
      required this.ingredients});

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    for (int i = 1; i <= 15; i++) {
      final ingredient = json['strIngredient$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }
    return Cocktail(
      name: json['strDrink'],
      imageUrl: json['strDrinkThumb'],
      instructions: json['strInstructions'] ?? '',
      ingredients: ingredients,
    );
  }
}
