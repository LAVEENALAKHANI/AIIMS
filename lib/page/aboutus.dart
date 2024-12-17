import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
      title: const Text(
        "About Us",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      centerTitle: true,
      backgroundColor: Color(0xFFB54321),
      elevation: 1,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeroSection(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/heroimage.png',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.1),
                  Colors.transparent,
                  Colors.black.withOpacity(0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('ABOUT US'),
        const SizedBox(height: 20),
        _buildContentCard(
          title: 'Introduction',
          content: [
            _buildParagraph(
              "Creating a country imbued with a scientific culture was Jawaharlal Nehru's dream, and immediately after independence he prepared a grand design to achieve it. Among the temples of modern India which he designed, was a centre of excellence in the medical sciences. Nehru's dream was that such a centre would set the pace for medical education and research in Southeast Asia, and in this he had the wholehearted support of his Health Minister, Rajkumari Amrit Kaur.",
            ),
            _buildParagraph(
              "The health survey and development committee, chaired by Sir Joseph Bhore, an Indian Civil Servant, had in 1946 already recommended the establishment of a national medical centre which would concentrate on meeting the need for highly qualified manpower to look after the nation's expanding health care activities.",
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildContentCard(
          title: 'Establishment',
          content: [
            _buildParagraph(
              "All-India Institute of Medical Sciences was established as an institution of national importance by an Act of Parliament with the objects to develop patterns of teaching in Undergraduate and Post-graduate Medical Education in all its branches so as to demonstrate a high standard of Medical Education in India.",
            ),
            _buildParagraph(
              "The Institute has comprehensive facilities for teaching, research and patient-care. As provided in the Act, AIIMS conducts teaching programs in medical and para-medical courses both at undergraduate and postgraduate levels and awards its own degrees.",
            ),
          ],
        ),
        const SizedBox(height: 20),
        _buildContentCard(
          title: 'Facilities & Departments',
          content: [
            _buildParagraph(
              "Twenty-five clinical departments including four super specialty centers manage practically all types of disease conditions with support from pre- and Para-clinical departments. AIIMS also manages a 60-beded hospital in the Comprehensive Rural Health Centre at Ballabgarh in Haryana and provides health cover to about 2.5 lakh population through the Centre for Community Medicine.",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildContentCard({
    required String title,
    required List<Widget> content,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFFB54321),
            ),
          ),
          const SizedBox(height: 15),
          ...content,
        ],
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          height: 1.6,
          color: Colors.black87,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}