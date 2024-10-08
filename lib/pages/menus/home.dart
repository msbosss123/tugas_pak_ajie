import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // NU's white background
      appBar: AppBar(
        backgroundColor: Colors.green, // NU style color
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.location_on, color: Colors.white),
            const SizedBox(width: 8),
            const Text(
              "Lokasi Anda",
              style: TextStyle(color: Colors.white),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.white),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              // Implement search functionality here
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Implement notification functionality here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Promo Banner Section with NU style
            Container(
              height: 150,
              width: double.infinity,
              color: Colors.green[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 50), // Provide some spacing
                    Text(
                      "Tukar Poin NU nyel",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Scan Kartu NU nyel di sini!",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Food Cards Horizontal Scroll Section (side by side)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 200, // Adjust height as needed
                child: ListView(
                  scrollDirection: Axis.horizontal, // Horizontal scroll
                  children: [
                    _buildFoodCard(
                      Icons.local_pizza,
                      "Pepperoni Pizza",
                      "Mulai dari Rp50.000",
                    ),
                    const SizedBox(width: 16), // Spacing between cards
                    _buildFoodCard(
                      Icons.fastfood,
                      "Cheeseburger",
                      "Mulai dari Rp30.000",
                    ),
                    const SizedBox(width: 16),
                    _buildFoodCard(
                      Icons.rice_bowl,
                      "Nasi Goreng Spesial",
                      "Mulai dari Rp25.000",
                    ),
                    const SizedBox(width: 16),
                    _buildFoodCard(
                      Icons.local_dining,
                      "Ayam Crispy",
                      "Mulai dari Rp40.000",
                    ),
                    const SizedBox(width: 16),
                    _buildFoodCard(
                      Icons.icecream,
                      "Cumi Saus Padang",
                      "Mulai dari Rp60.000",
                    ),
                    const SizedBox(width: 16),
                    _buildFoodCard(
                      Icons.restaurant,
                      "Kepiting Saus Mentega",
                      "Mulai dari Rp120.000",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a food card for horizontal scroll
  Widget _buildFoodCard(IconData icon, String foodName, String price) {
    return GestureDetector(
      onTap: () {
        // Add your onTap functionality here
        print("$foodName ditekan!");
      },
      child: SizedBox(
        width: 150, // Width for the card
        child: Card(
          color: Colors.grey[100], // Light card background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Icon(icon,
                    size: 60, color: Colors.green), // Green icons for food
                const SizedBox(height: 8),
                Text(
                  foodName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
