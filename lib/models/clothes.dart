class Clothes{
  String title;
  String subTtile;
  String price;
  String imageUrl;
  List<String> detailUrl;
  Clothes(this.title, this.subTtile, this.price, this.imageUrl, this.detailUrl);
  static List<Clothes> generateClothes() {
    return [
      Clothes("Gucci Oversize", "Hoodie", "\$79.99", "assets/images/arrival1.png", ["assets/images/arrival1.png", "assets/images/arrival2.png"]),
      Clothes("Gucci Oversize1", "Hoodie1", "\$79.99", "assets/images/arrival1.png", ["assets/images/arrival1.png", "assets/images/arrival2.png"]),
    ];
  } 
}

