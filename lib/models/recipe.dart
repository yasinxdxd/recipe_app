class Recipe {
  final int recipeId;
  final double rating;
  final String cookingTime;
  final String category;
  final String recipeName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  Recipe(
      {required this.recipeId,
      required this.category,
      required this.recipeName,
      required this.rating,
      required this.cookingTime,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});
}
