import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final List<OrderItem> orderItems = [
    OrderItem(
      "Nasi Goreng",
      "pesanan ing tanggal 21 Sept 2024",
      "Rp30.000",
      Icons.rice_bowl,
      "https://assets.unileversolutions.com/recipes-v2/242794.jpg",
    ),
    OrderItem(
      "Paket Hemat Ayam Crispy",
      "pesanan ing tanggal 18 Sept 2024",
      "Rp50.000",
      Icons.local_dining,
      "https://eorder-bppbj.jakarta.go.id/web/image/product.image/27963/image?unique=b6b7ee0",
    ),
    OrderItem(
      "Seafood Platter",
      "pesanan ing tanggal 15 Sept 2024",
      "Rp100.000",
      Icons.emoji_food_beverage,
      "https://asset.kompas.com/crops/Q6dYeoOTbUMQj-cy9d2p2QiIhcc=/0x0:1000x667/750x500/data/photo/2023/06/29/649d11a1ade36.jpeg",
    ),
    OrderItem(
      "Cumi Goreng Tepung",
      "pesanan ing tanggal 10 Sept 2024",
      "Rp45.000",
      Icons.icecream,
      "https://img-global.cpcdn.com/recipes/25c386012da26447/1200x630cq70/photo.jpg",
    ),
    OrderItem(
      "Kepiting Saus Padang",
      "pesanan ing tanggal 05 Sept 2024",
      "Rp120.000",
      Icons.restaurant_menu,
      "https://i.ytimg.com/vi/jNsQJocwRhU/maxresdefault.jpg",
    ),
  ];

  List<OrderItem> filteredOrderItems = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredOrderItems = orderItems;
  }

  void _filterOrderItems(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredOrderItems = orderItems.where((order) {
        return order.foodName.toLowerCase().contains(searchQuery);
      }).toList();
    });
  }

  void _toggleBookmark(OrderItem orderItem) {
    setState(() {
      orderItem.isBookmarked = !orderItem.isBookmarked;
    });
  }

  void _showBookmarkedItems() {
    List<OrderItem> bookmarkedItems =
        orderItems.where((item) => item.isBookmarked).toList();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Bookmarked Items"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              itemCount: bookmarkedItems.length,
              itemBuilder: (context, index) {
                final orderItem = bookmarkedItems[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(orderItem.imageUrl),
                  ),
                  title: Text(orderItem.foodName),
                  subtitle: Text(orderItem.date),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _deleteBookmark(orderItem);
                    },
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  void _deleteBookmark(OrderItem orderItem) {
    setState(() {
      orderItem.isBookmarked = false;
    });

    Navigator.of(context).pop(); // Close the dialog
    _showBookmarkedItems(); // Show the updated list of bookmarked items
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
            icon: const Icon(Icons.bookmark, color: Colors.white),
            onPressed: _showBookmarkedItems, // Menampilkan dialog bookmark
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
            const Text(
              "Ayo Podo Pesen bolo!!",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredOrderItems.length,
                itemBuilder: (context, index) {
                  final orderItem = filteredOrderItems[index];
                  return _buildHistoryCard(
                    orderItem,
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

  Widget _buildHistoryCard(OrderItem orderItem) {
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
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage(orderItem.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderItem.foodName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    orderItem.date,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.bookmark,
                color: orderItem.isBookmarked ? Colors.yellow : Colors.grey,
              ),
              onPressed: () {
                _toggleBookmark(orderItem);
              },
            ),
            Text(
              orderItem.price,
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

// OrderItem class to hold order data with image URL and bookmark status
class OrderItem {
  final String foodName;
  final String date;
  final String price;
  final IconData icon;
  final String imageUrl;
  bool isBookmarked; // Status bookmark

  OrderItem(this.foodName, this.date, this.price, this.icon, this.imageUrl,
      {this.isBookmarked = false}); // Inisialisasi bookmark dengan false
}
