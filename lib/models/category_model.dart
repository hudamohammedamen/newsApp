import 'dart:ui';

class CategoryModel {
  String id;
  String name;
  String image;
  Color color;

  CategoryModel(this.id, this.name, this.image, this.color);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
          "sports", "Sports", "assets/images/ball.png", const Color(0xFFC91C22)),
      CategoryModel("business", "Business", "assets/images/bussines.png",
          const Color(0xFFCF7E48)),
      CategoryModel("entertainment", "Entertainment",
          "assets/images/environment.png", const Color(0xFF4882CF)),
      CategoryModel("general", "General", "assets/images/Politics.png",
          const Color(0xFF003E90)),
      CategoryModel(
          "health", "Health", "assets/images/health.png", const Color(0xFFED1E79)),
      CategoryModel(
          "science", "Science", "assets/images/science.png", const Color(0xFFF2D352)),
      CategoryModel("technology", "Technology", "assets/images/bussines.png",
          const Color(0xFFCF7E48)),
    ];
  }
}
