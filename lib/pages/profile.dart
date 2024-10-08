import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green[800], // Gojek's signature green color
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white), // White icon
            onPressed: () {
              // Implement edit profile logic
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://media.istockphoto.com/id/1495088043/id/vektor/ikon-profil-pengguna-avatar-atau-ikon-orang-gambar-profil-simbol-potret-gambar-potret.jpg?s=612x612&w=0&k=20&c=vMnxIgiQh5EFyQrFGGNKtbb6tuGCT04L58nwwEGzIbc=', // Replace with user profile image URL
                ),
              ),
            ),
            const SizedBox(height: 16),

            // User Information
            Center(
              child: Column(
                children: const [
                  Text(
                    "Sfyuel", // Replace with user's name
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Black text for name
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "hilz@gmai.com", // Replace with user's email
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54, // Gray text for email
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Action buttons section title
            const Text(
              "Aksi",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Black text
              ),
            ),
            const SizedBox(height: 16),

            // Button to view order history
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.history, color: Colors.green),
                title: const Text(
                  "Makanan",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: Colors.green[800]),
                onTap: () {
                  // Implement navigation to order history
                },
              ),
            ),
            const SizedBox(height: 8),

            // Button to change password
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.lock, color: Colors.green),
                title: const Text(
                  "Ubah Kata Sandi",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: Colors.green[800]),
                onTap: () {
                  // Implement navigation to change password
                },
              ),
            ),
            const SizedBox(height: 8),

            // Button to logout
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: ListTile(
                leading: const Icon(Icons.logout, color: Colors.green),
                title: const Text(
                  "Keluar",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: Colors.green[800]),
                onTap: () {
                  // Implement logout logic
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Gojek's clean white background
    );
  }
}
