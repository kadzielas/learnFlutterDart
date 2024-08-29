class Product {
  const Product({
    required this.id,
    required this.type,
    required this.title,
    required this.price,
    required this.company,
    required this.image,
    required this.bucket,
  });
  final String id;
  final String type;
  final String title;
  final double price;
  final String company;
  final String image;
  final bool bucket;
}
