import 'package:flutter/material.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  
  bool isTwoFactorEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Security & Privacy"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle("Account Security"),
          _buildSecurityTile(
            icon: Icons.lock_outline,
            title: "Change Password",
            subtitle: "Update your account password regularly",
            onTap: () {
              
            },
          ),
          _buildSecurityTile(
            icon: Icons.verified_user_outlined,
            title: "Two-Factor Authentication",
            subtitle: "Add an extra layer of security",
            trailing: Switch(
              value: isTwoFactorEnabled,
              activeThumbColor: Colors.green, 
              activeTrackColor: Colors.green.withOpacity(0.3), 
              onChanged: (val) {
                setState(() {
                  isTwoFactorEnabled = val;
                });
              },
            ),
            onTap: null,
          ),
          
          const SizedBox(height: 20),
          _buildSectionTitle("Garden Community Safety"),
          _buildSecurityTile(
            icon: Icons.info_outline,
            title: "Gardening Tips",
            subtitle: "How to prevent plant diseases",
            onTap: () {
              
            },
          ),
          _buildSecurityTile(
            icon: Icons.verified_outlined,
            title: "Identity Verification",
            subtitle: "Verify your ID to gain more trust",
            trailing: const Icon(Icons.chevron_right),
            onTap: () {},
          ),

          const SizedBox(height: 20),
          _buildSectionTitle("Privacy"),
          _buildSecurityTile(
            icon: Icons.location_on_outlined,
            title: "Location Privacy",
            subtitle: "Control who sees your garden location",
            onTap: () {},
          ),

          const SizedBox(height: 30),
          Center(
            child: TextButton(
              onPressed: () {
                
              },
              child: const Text(
                "Delete Account",
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, left: 5),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  
  Widget _buildSecurityTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    required VoidCallback? onTap,
  }) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.green),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: trailing ?? const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}