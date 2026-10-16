import 'package:flutter/material.dart';
import 'package:new_flutter_project/features/products/model/product_model.dart';
import 'package:new_flutter_project/features/products/widget/product_card.dart';

class ProductListScreens extends StatefulWidget {
  const ProductListScreens({super.key});

  @override
  State<ProductListScreens> createState() => _ProductListScreensState();
}

class _ProductListScreensState extends State<ProductListScreens> {
  final Set<int> favourites = {};

  final List<ProductModel> products = [
    ProductModel(
      id: 1,
      name: 'Laptop',
      price: 85000.0,
      imageUrl:
          'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=600',
    ),
    ProductModel(
      id: 2,
      name: 'Smartphone',
      price: 45000.0,
      imageUrl:
          'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=600',
    ),
    ProductModel(
      id: 3,
      name: 'Headphones',
      price: 3500.0,
      imageUrl:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
    ),
    ProductModel(
      id: 4,
      name: 'Smart Watch',
      price: 12000.0,
      imageUrl:
          'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=600',
    ),
    ProductModel(
      id: 5,
      name: 'Camera',
      price: 65000.0,
      imageUrl:
          'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=600',
    ),
    ProductModel(
      id: 6,
      name: 'Sneakers',
      price: 5500.0,
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=600',
    ),
    ProductModel(
      id: 7,
      name: 'Backpack',
      price: 2500.0,
      imageUrl:
          'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=600',
    ),
    ProductModel(
      id: 8,
      name: 'Sunglasses',
      price: 1800.0,
      imageUrl:
          'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=600',
    ),
    ProductModel(
      id: 9,
      name: 'Gaming Controller',
      price: 4500.0,
      imageUrl:
          'https://images.unsplash.com/photo-1592840496694-26d035b52b48?w=600',
    ),
    ProductModel(
      id: 10,
      name: 'Coffee Mug',
      price: 850.0,
      imageUrl:
          'https://images.unsplash.com/photo-1514228742587-6b1558fcca3d?w=600',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List Screen")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final product = products[index];

            return ProductCard(
              product: product,
              isFavoutrite: favourites.contains(product.id),
              onFavourite: () {
                setState(() {
                  if (!favourites.add(product.id)) {
                    favourites.remove(product.id);
                  }
                });
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Scaffold(
                      appBar: AppBar(title: Text(product.name)),
                      body: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              product.imageUrl,
                              height: 200,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image, size: 60),
                            ),
                            const SizedBox(height: 16),
                            Text(product.name),
                            Text("ID: ${product.id}"),
                            Text("Rs. ${product.price}"),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
