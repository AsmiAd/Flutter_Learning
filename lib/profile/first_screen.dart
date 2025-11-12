import 'package:flutter/material.dart';
import 'package:flutter_learning/profile/profile_home_screen.dart';
import 'package:flutter_learning/profile/profile_map_screen.dart';
import 'package:flutter_learning/profile/profile_settings_screen.dart';
import 'package:flutter_learning/profile/profile_transfer_screen.dart';
import 'package:flutter_learning/profile/profile_edit_screen.dart';

class FirstProfileScreen extends StatefulWidget {
  const FirstProfileScreen({super.key});

  @override
  State<FirstProfileScreen> createState() => _FirstProfileScreenState();
}

class _FirstProfileScreenState extends State<FirstProfileScreen> {
  int currentIndex = 4;

  String name = "Terry Melton";
  String email = "melton89@gmail.com";
  String phone = "+1 201 555-0123";
  String address = "70 Rainey Street, Apartment 146,\nAustin TX 78701";

  Future<void> editProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileEditScreen(
          name: name,
          email: email,
          phone: phone,
          address: address,
        ),
      ),
    );

    if (result != null && result is Map<String, String>) {
      setState(() {
        name = result['name'] ?? name;
        email = result['email'] ?? email;
        phone = result['phone'] ?? phone;
        address = result['address'] ?? address;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const ProfileHomeScreen(),
      const ProfileMapScreen(),
      const ProfileTransferScreen(),
      const ProfileSettingsScreen(),
      FirstProfileScreenBody(
        name: name,
        email: email,
        phone: phone,
        address: address,
        onEdit: editProfile,
      ),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF00B686),
        unselectedItemColor: Colors.grey[500],
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Transfer'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}
class FirstProfileScreenBody extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final VoidCallback onEdit;

  const FirstProfileScreenBody({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 24),
            const Text(
              "Profile",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 24),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(
                      'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8',
                    ),
                  ),
                ),
                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.edit, size: 16, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Personal info",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      GestureDetector(
                        onTap: onEdit,
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InfoRow(icon: Icons.person_outline, label: "Name", value: name),
                  const SizedBox(height: 20),
                  InfoRow(icon: Icons.email_outlined, label: "E-mail", value: email),
                  const SizedBox(height: 20),
                  InfoRow(icon: Icons.phone_outlined, label: "Phone number", value: phone),
                  const SizedBox(height: 20),
                  InfoRow(icon: Icons.home_outlined, label: "Home address", value: address),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Text(
                "Account info",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black, size: 22),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 15)),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(
                        color: Colors.black87, fontSize: 14.5, height: 1.3)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
