import 'package:flutter/material.dart';

class ProductModel {
  final String name;
  final double price;
  final String category;
  final int id;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
  });
}

class FilterProductScreen extends StatefulWidget {
  const FilterProductScreen({super.key});

  @override
  State<FilterProductScreen> createState() => _FilterProductScreenState();
}

class _FilterProductScreenState extends State<FilterProductScreen> {
  final List<String> allCategories = [
    "All",
    "Electronics",
    "Footwear",
    "Clothing",
  ];

  final Set<String> selectedCategories = {};

  final List<ProductModel> allProducts = [
    // Electronics
    ProductModel(
      id: 1,
      name: "Wireless Bluetooth Headphones",
      category: "Electronics",
      price: 79.99,
    ),
    ProductModel(
      id: 2,
      name: "Smartphone Gimbal Stabilizer",
      category: "Electronics",
      price: 119.50,
    ),
    ProductModel(
      id: 3,
      name: "Portable Power Bank 20000mAh",
      category: "Electronics",
      price: 45.00,
    ),
    ProductModel(
      id: 4,
      name: "Smart Fitness Watch",
      category: "Electronics",
      price: 129.99,
    ),
    ProductModel(
      id: 5,
      name: "USB-C Fast Charger Hub",
      category: "Electronics",
      price: 29.99,
    ),

    // Footwear
    ProductModel(
      id: 6,
      name: "Running Sport Sneakers",
      category: "Footwear",
      price: 89.99,
    ),
    ProductModel(
      id: 7,
      name: "Classic Leather Casual Shoes",
      category: "Footwear",
      price: 65.00,
    ),
    ProductModel(
      id: 8,
      name: "Waterproof Hiking Boots",
      category: "Footwear",
      price: 140.00,
    ),
    ProductModel(
      id: 9,
      name: "Lightweight Slip-On Loafers",
      category: "Footwear",
      price: 45.50,
    ),
    ProductModel(
      id: 10,
      name: "High-Top Basketball Shoes",
      category: "Footwear",
      price: 110.00,
    ),

    // Clothing
    ProductModel(
      id: 11,
      name: "Oversized Cotton Hoodie",
      category: "Clothing",
      price: 55.00,
    ),
    ProductModel(
      id: 12,
      name: "Slim Fit Denim Jeans",
      category: "Clothing",
      price: 69.99,
    ),
    ProductModel(
      id: 13,
      name: "Classic Crewneck T-Shirt",
      category: "Clothing",
      price: 24.99,
    ),
    ProductModel(
      id: 14,
      name: "Waterproof Windbreaker Jacket",
      category: "Clothing",
      price: 95.00,
    ),
    ProductModel(
      id: 15,
      name: "Thermal Fleece Joggers",
      category: "Clothing",
      price: 49.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = allProducts.where((product) {
      if (selectedCategories.contains("All") || selectedCategories.isEmpty) {
        return true;
      }
      return selectedCategories.contains(product.category);
    }).toList();
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: allCategories.map((category) {
                return FilterChip(
                  label: Text(category),
                  selected: selectedCategories.contains(category),
                  onSelected: (selected) {
                    setState(() {
                      selected
                          ? selectedCategories.add(category)
                          : selectedCategories.remove(category);
                    });
                  },
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Text(product.id.toString()),
                    title: Text(product.name),
                    subtitle: Text(product.category),
                    trailing: Text(product.price.toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
