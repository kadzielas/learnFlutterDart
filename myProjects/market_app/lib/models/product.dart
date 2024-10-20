class Product {
  const Product({
    required this.id,
    required this.type,
    required this.title,
    required this.image,
    required this.bucket,
    required this.category,
  });
  final String id;
  final String type;
  final String title;
  final String image;
  final bool bucket;
  final String category;

  get keys => null;
}
