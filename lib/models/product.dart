import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String subTitle;
  final String imageUrl;
  final String prodDescription;
  final int price;

  Product(
      {this.id,
      this.title,
      this.subTitle,
      this.imageUrl,
      this.prodDescription,
      this.price});
}

class Products with ChangeNotifier {
  final List<Product> productsItem = [
    Product(
      id: '1',
      title: 'Elisbetta Frnchi',
      subTitle: 'Slim fit Floral dress',
      imageUrl:
          'https://images.unsplash.com/photo-1623513520904-e559bce49415?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0MHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      price: 234,
      prodDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum scelerisque consectetur congue. Sed sed leo vel tortor sagittis pretium eu vel velit. Sed interdum, purus a porta finibus, turpis metus convallis felis, ut aliquet dui mauris sed metus. Proin sit amet orci nec sapien finibus luctus non vel dolor. Suspendisse feugiat fermentum erat id fringilla.',
    ),
    Product(
      id: '2',
      title: 'Slim Frnchi',
      subTitle: 'Slim fit Floral dress',
      imageUrl:
          'https://images.unsplash.com/photo-1623513520904-e559bce49415?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0MHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      price: 235,
      prodDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum scelerisque consectetur congue. Sed sed leo vel tortor sagittis pretium eu vel velit. Sed interdum, purus a porta finibus, turpis metus convallis felis, ut aliquet dui mauris sed metus. Proin sit amet orci nec sapien finibus luctus non vel dolor. Suspendisse feugiat fermentum erat id fringilla.',
    ),
    Product(
      id: '3',
      title: 'Floral Frnchi',
      subTitle: 'Slim fit Floral dress',
      imageUrl:
          'https://images.unsplash.com/flagged/photo-1560411359-cc71b5ec0c10?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDF8UzRNS0xBc0JCNzR8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      price: 456,
      prodDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum scelerisque consectetur congue. Sed sed leo vel tortor sagittis pretium eu vel velit. Sed interdum, purus a porta finibus, turpis metus convallis felis, ut aliquet dui mauris sed metus. Proin sit amet orci nec sapien finibus luctus non vel dolor. Suspendisse feugiat fermentum erat id fringilla.',
    ),
    Product(
      id: '4',
      title: 'Frnchi Elisbetta ',
      subTitle: 'Slim fit Floral dress',
      imageUrl:
          'https://images.unsplash.com/photo-1624028496705-0ebf761ebc69?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE5fFM0TUtMQXNCQjc0fHxlbnwwfHx8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
      price: 234,
      prodDescription:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum scelerisque consectetur congue. Sed sed leo vel tortor sagittis pretium eu vel velit. Sed interdum, purus a porta finibus, turpis metus convallis felis, ut aliquet dui mauris sed metus. Proin sit amet orci nec sapien finibus luctus non vel dolor. Suspendisse feugiat fermentum erat id fringilla.',
    ),
  ];

  Product findByID(String id) {
    return productsItem.firstWhere((prod) => prod.id == id);
  }
}
