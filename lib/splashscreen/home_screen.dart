import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Hero section images
  final List<String> _heroImages = [
    'assets/image_1.png',
    'assets/image_2.png',
    'assets/image_3.png',
  ];

  // Gallery section data
  final List<Map<String, dynamic>> _galleryItems = [
    {
      'image': "assets/gallary_2.png",
      'name': 'Important Visits/Events',
      'description': 'View our important events and visits'
    },
    {
      'image': "assets/gallary_1.png",
      'name': 'Vintage Photos',
      'description': 'Browse through our history'
    },
    {
      'image': "assets/gallary_3.png",
      'name': 'Institute Day',
      'description': 'Celebrations and ceremonies'
    },
  ];

  // Quick access icons
  final List<Map<String, dynamic>> _quickAccessItems = [
    {'icon': Icons.school, 'name': 'Faculty', 'color': Color(0xFFB54321)},
    {'icon': Icons.local_hospital, 'name': 'Patient', 'color': Color(0xFFB54321)},
    {'icon': Icons.person, 'name': 'Student', 'color': Color(0xFFB54321)},
    {'icon': Icons.work, 'name': 'Employee', 'color': Color(0xFFB54321)},
    {'icon': Icons.business, 'name': 'Vendor', 'color': Color(0xFFB54321)},
    {'icon': Icons.group, 'name': 'Visitor', 'color': Color(0xFFB54321)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerClass(),
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      backgroundColor: Color(0xFFB54321),
      elevation: 1,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeroSection(),
          const SizedBox(height: 20),
          _buildSectionTitle('Quick Access'),
          _buildQuickAccessGrid(),
          const SizedBox(height: 20),
          _buildSectionTitle('Gallery'),
          _buildGallerySection(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      height: 200,
      child: PageView.builder(
        itemCount: _heroImages.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                _heroImages[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildQuickAccessGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _quickAccessItems.length,
        itemBuilder: (context, index) {
          return _buildQuickAccessItem(_quickAccessItems[index]);
        },
      ),
    );
  }

  Widget _buildQuickAccessItem(Map<String, dynamic> item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: item['color'],
            boxShadow: [
              BoxShadow(
                color: item['color'].withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            item['icon'],
            size: 30,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          item['name'],
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildGallerySection() {
    return Container(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _galleryItems.length,
        itemBuilder: (context, index) {
          return _buildGalleryCard(_galleryItems[index]);
        },
      ),
    );
  }

  Widget _buildGalleryCard(Map<String, dynamic> item) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                item['image'],
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['description'],
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}