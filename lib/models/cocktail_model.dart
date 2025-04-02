class Cocktail {
  final String name;
  final String imageUrl;

  Cocktail({required this.name, required this.imageUrl});

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      name: json['strDrink'],
      imageUrl: json['strDrinkThumb'],
    );
  }
}
