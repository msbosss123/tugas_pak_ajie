import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  // List of food orders, including icons and image URLs
  final List<OrderItem> orderItems = [
    OrderItem(
      "Nasi Goreng",
      "pesanan ing tanggal 21 Sept 2024",
      "Rp30.000",
      Icons.rice_bowl,
      "https://assets.unileversolutions.com/recipes-v2/242794.jpg", // Updated URL
    ),
    OrderItem(
      "Paket Hemat Ayam Crispy",
      "pesanan ing tanggal 18 Sept 2024",
      "Rp50.000",
      Icons.local_dining,
      "https://eorder-bppbj.jakarta.go.id/web/image/product.image/27963/image?unique=b6b7ee0", // Updated URL
    ),
    OrderItem(
      "Seafood Platter",
      "pesanan ing tanggal 15 Sept 2024",
      "Rp100.000",
      Icons.emoji_food_beverage,
      "https://asset.kompas.com/crops/Q6dYeoOTbUMQj-cy9d2p2QiIhcc=/0x0:1000x667/750x500/data/photo/2023/06/29/649d11a1ade36.jpeg", // Updated URL
    ),
    OrderItem(
      "Cumi Goreng Tepung",
      "pesanan ing tanggal 10 Sept 2024",
      "Rp45.000",
      Icons.icecream,
      "https://img-global.cpcdn.com/recipes/25c386012da26447/1200x630cq70/photo.jpg", // Updated URL
    ),
    OrderItem(
      "Kepiting Saus Padang",
      "pesanan ing tanggal 05 Sept 2024",
      "Rp120.000",
      Icons.restaurant_menu,
      "https://i.ytimg.com/vi/jNsQJocwRhU/maxresdefault.jpg", // Updated URL
    ),
  ];

  // List of filtered order items based on search query
  List<OrderItem> filteredOrderItems = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Initially, show all order items
    filteredOrderItems = orderItems;
  }

  // Method to update the filtered list based on the search query
  void _filterOrderItems(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredOrderItems = orderItems.where((order) {
        return order.foodName.toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 71, 2),
        elevation: 0,
        title: const Text(
          "Menu",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Search action (optional, already implemented in TextField)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // Search Field
            TextField(
              onChanged: _filterOrderItems,
              decoration: InputDecoration(
                hintText: "Cari pesanan...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.green),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.green),
              ),
            ),
            const SizedBox(height: 16),

            // Section Title
            const Text(
              "Ayo Podo Pesen bolo!!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            // Order History Cards
            Expanded(
              child: ListView.builder(
                itemCount: filteredOrderItems.length,
                itemBuilder: (context, index) {
                  final orderItem = filteredOrderItems[index];
                  return _buildHistoryCard(
                    orderItem.icon,
                    orderItem.imageUrl,
                    orderItem.foodName,
                    orderItem.date,
                    orderItem.price,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  // Helper method to build a history card
  Widget _buildHistoryCard(IconData icon, String imageUrl, String foodName,
      String date, String price) {
    return Card(
      color: Colors.green[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Image section
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),

            // Text Section
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    foodName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),

            // Price Section
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// OrderItem class to hold order data with image URL
class OrderItem {
  final String foodName;
  final String date;
  final String price;
  final IconData icon;
  final String imageUrl;

  OrderItem(this.foodName, this.date, this.price, this.icon, this.imageUrl);
}
