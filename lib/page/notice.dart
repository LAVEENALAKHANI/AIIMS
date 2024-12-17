import 'package:flutter/material.dart';
import '../drawer/drawer.dart';

class NoticePage extends StatelessWidget {
  NoticePage({super.key});

  // Sample data for notices
  final List<Map<String, String>> notices = [
    {
      'title':
          'सर्विस ब्लॉक में संचालिक की जाने वाली सुविधाओं हेतु योजना बनाने तथा निविदा आंमत्रित करने संबंधी/Comprehensive inergration of e-Hospital with ABDM framework reg.',
      'category': 'Miscellaneous',
      'date': '14-12-2024',
    },
    {
      'title':
          'Extension of timeline for recording of e-APAR for the assessment period 01-04-2024 to 31-03-2024 (2023-24) - reg.+',
      'category': 'Miscellaneous',
      'date': '14-12-2024',
    },
    {
      'title':
          'Advertisement for the post of Public Relations Officer on deputation basis at the AIIMS, New Delhi - Cancellation thereof',
      'category': 'Recruitment/Interviews',
      'date': '14-12-2024',
    },
    {
      'title':
          'Planing & tendering for facilities to be commissioned in the Service Block reg.',
      'category': 'Miscellaneous',
      'date': '14-12-2024',
    },
    {
      'title':
          'एबीडीएम ढांचे के साथ ईहॉस्पिटल का व्यापक एकीकरण।/Comprehensive integration of eHospital with ABDM framework reg.',
      'category': 'Miscellaneous',
      'date': '14-12-2024',
    },
    {
      'title':
          'INTERVIEW SCHEDULED - Recruitment of Assistant Professor of various disciplines on contract basis at AIIMS, New Delhi',
      'category': 'Recruitment/Interviews',
      'date': '14-12-2024',
    },
    {
      'title':
          'एम्स, नई दिल्ली में वरिष्ठ प्रशासनिक सहायक ए के पद पर पदोन्नति।/Promotion to the post of Senior Administrative Assistant A at the AIIMS , New Delhi.',
      'category': 'Promotions',
      'date': '14-12-2024',
    },
    {
      'title':
          'Dr. Sudhir Sarangi Store Officer In-charge has been relieved & Dr. Jagriti Bhatia as the new Store Officer In-charge at Deptt. of Pharmacology. AIIMS',
      'category': 'Appointments',
      'date': '14-12-2024',
    },
    {
      'title':
          'निदेशक कार्यालय से संबंधित संसाधनों का सुव्यवस्थित एवं इष्टतम उपयोग करने संबंधी/Rationalization & optimization of resources attached with the office of Director - reg.',
      'category': '	Miscellaneous',
      'date': '14-12-2024',
    },
    {
      'title':
          'एम्स नई दिल्ली में वरिष्ठ परिचर्या अधिकारी के पद पर पदोन्नति/Promotion to the post of Sr. Nursing Officer at the AIIMS, New Delhi',
      'category': 'Promotions',
      'date': '14-12-2024',
    },
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
      title: const Text(
        "Notices",
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
                _buildSectionTitle('Latest Notices'),
                const SizedBox(height: 20),
                _buildNoticeList(),
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
      height: 200,
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
                height: 150,
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildNoticeList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: notices.length,
      itemBuilder: (context, index) {
        return _buildNoticeCard(
          serialNumber: index + 1,
          notice: notices[index],
        );
      },
    );
  }

  Widget _buildNoticeCard({
    required int serialNumber,
    required Map<String, String> notice,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          // Handle notice tap
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB54321),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '$serialNumber',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notice['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _buildTag(notice['category']!),
                            const SizedBox(width: 8),
                            Text(
                              notice['date']!,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFB54321).withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFFB54321),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}