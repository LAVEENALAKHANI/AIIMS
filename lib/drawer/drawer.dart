import 'package:flutter/material.dart';
import '../page/aboutus.dart';
import '../page/contactus.dart';
import '../page/library.dart';
import '../page/notice.dart';
import '../splashscreen/home_screen.dart';

class DrawerClass extends StatefulWidget {
  const DrawerClass({super.key});

  @override
  State<DrawerClass> createState() => _DrawerClassState();
}

class _DrawerClassState extends State<DrawerClass> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildDrawerHeader(),
          Expanded(
            child: _buildDrawerItems(),
          ),
          _buildDrawerFooter(),
        ],
      ),
    );
  }

 Widget _buildDrawerHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFB54321),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const CircleAvatar(
              backgroundImage: AssetImage("assets/icon.png"),
              radius: 40,
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            "AIIMS",
            style: TextStyle(
              fontSize: 28,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "contact@aiims.edu",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildDrawerItems() {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        const SizedBox(height: 8),
        _buildDrawerItem(
          icon: Icons.home_rounded,
          title: 'Home',
          onTap: () => _navigateToPage(const HomeScreen(title: 'AIIMS')),
        ),
        _buildDrawerItem(
          icon: Icons.info_outline_rounded,
          title: 'About Us',
          onTap: () => _navigateToPage(const AboutPage()),
        ),
        _buildDrawerItem(
          icon: Icons.library_books_rounded,
          title: 'Library',
          onTap: () => _navigateToPage(const LibraryPage()),
        ),
        _buildDrawerItem(
          icon: Icons.notifications_none_rounded,
          title: 'Notice',
          onTap: () => _navigateToPage(NoticePage()),
        ),
        _buildDrawerItem(
          icon: Icons.contact_mail_rounded,
          title: 'Contact Us',
          onTap: () => _navigateToPage(const ContactPage()),
        ),
      ],
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: const Color(0xFFB54321),
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
          color: Colors.grey,
        ),
        onTap: () {
          onTap();
          _showSnackBar(title);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildDrawerFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 8),
          Text(
            'Version 1.0.0',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _navigateToPage(Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  void _showSnackBar(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Navigating to $title'),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color(0xFFB54321),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}