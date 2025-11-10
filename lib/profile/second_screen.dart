import 'package:flutter/material.dart';

class SecondProfileScreen extends StatelessWidget {
  const SecondProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              CircleAvatar(
                radius: 48,
                backgroundImage: NetworkImage(
                  'https://newprofilepic.photo-cdn.net//assets/images/article/profile.jpg?90af0c8',
                ),
              ),
              SizedBox(height: 14),

              Text(
                'Christina Angela',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Text(
                "@angela.christina123",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),

              SizedBox(height: 24),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade600,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: const Center(
                          child: Text(
                            "General",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: Text(
                            "Badges",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24),

              _buildTile(Icons.person, "Name", "Christina Angela"),
              _buildTile(
                Icons.email_outlined,
                "Email",
                "christina.angela123@gmail.com",
              ),
              _buildTile(
                Icons.lock_outline,
                "Password",
                "Tap to Change Password",
              ),
              _buildTile(
                Icons.phone_outlined,
                "Phone Number",
                "(684) 555-0102",
              ),
              _buildTile(Icons.credit_card, "Payment", "Tap to Change Payment"),
              _buildTile(
                Icons.privacy_tip_outlined,
                "Privacy Policy",
                "Tap to See Privacy Policy",
                showEdit: false,
              ),

              SizedBox(height: 30),

              SizedBox(
                width: 220,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.blue.shade600),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    "Become Premium",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {},
                child: Text(
                  "LOG OUT",
                  style: TextStyle(
                    color: Colors.blue.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.blue.shade600,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.square_outlined), label: ''),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

Widget _buildTile(
  IconData icon,
  String title,
  String subtitle, {
  bool showEdit = true,
}) {
  return Column(
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: Colors.blue.shade600, size: 26,),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        trailing: showEdit
            ? Text(
                "Edit",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              )
            : const Icon(Icons.chevron_right, color: Colors.grey),
      ),
    ],
  );
}
