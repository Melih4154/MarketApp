class Product {
  int id;
  int categoryId;
  String productName;
  String description;
  double unitPrice;
  String url;
  int stock;
  bool inStock;
  Product(this.id, this.productName, this.description, this.categoryId,
      this.stock, this.unitPrice, this.url, this.inStock);
}
