import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController untuk username dan password
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo atau header aplikasi
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'Warung',
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      TextSpan(
                        text: 'NU',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            const Text(
              "Login ke Akunmu",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "Masukkan detail login Anda.",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 32),

            // Kolom email
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
            const SizedBox(height: 16),

            // Kolom password
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Kata Sandi',
                labelStyle: TextStyle(color: Colors.grey[700]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                suffixIcon: Icon(Icons.visibility_outlined,
                    color: Colors.grey[600]),
              ),
            ),
            const SizedBox(height: 8),

            const Text(
              "Kata sandi harus minimal 8 karakter, sertakan huruf besar, kecil, dan angka.",
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 32),

            // Tombol login
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  String username = usernameController.text;
                  String password = passwordController.text;

                  if (username.isNotEmpty && password.isNotEmpty) {
                    // Navigasi ke halaman utama
                    Get.toNamed('/homepage');
                  } else {
                    Get.snackbar(
                      'Login Error',
                      'Email dan Password tidak boleh kosong',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            const Text(
              "*Wajib diisi",
              style: TextStyle(fontSize: 12, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
